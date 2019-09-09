#include <stdio.h>
#include <cuda.h>
#include <cuda_runtime.h>
#include <string>
#include <iostream>

float *d_fields = NULL;
float *h_fields = NULL;
float *d_zvals = NULL;
float *h_zvals = NULL;

float *d_fixedXs = NULL;
float *d_fixedYs = NULL;

int res_ = 0;
int fSX_ = 0; //fieldSizeX
int fSY_ = 0; //fieldSizeY

__device__ __inline__ void min_id(float &x, const float y, int &idx, const int idy)
{
    if (y < x)
    {
        x = y;
        idx = idy;
    }
}

__global__ void find_closest(
    const int fsx, const int fsy, const int res, const float *fields,
    const float *fixedXs, const float *fixedYs,
    float *o_zvals, const float correction)
{
    __shared__ float dists[1024];
    __shared__ int ids[1024];

    float *dist_ptr = &dists[threadIdx.x];
    dist_ptr[0] = 3.4e+38f;

    int *id_ptr = &ids[threadIdx.x];
    id_ptr[0] = threadIdx.x;

    //get square distance
    const int ggid = blockIdx.x * (fsx * fsy) + threadIdx.x;
    if (threadIdx.x < (fsx * fsy) && !isnan(fields[ggid * 4]) && !isnan(fields[ggid * 4 + 1]))
    {
        dist_ptr[0] = 0.0f;
        dist_ptr[0] += (fixedXs[blockIdx.x % res] - fields[ggid * 4]) * (fixedXs[blockIdx.x % res] - fields[ggid * 4]);
        dist_ptr[0] += (fixedYs[blockIdx.x / res] - fields[ggid * 4 + 1]) * (fixedYs[blockIdx.x / res] - fields[ggid * 4 + 1]);
    }

    __syncthreads();

    for (int bla = 512; bla > 1; bla /= 2)
    {
        if (threadIdx.x < bla)
            min_id(dist_ptr[0], dist_ptr[bla - 1], id_ptr[0], id_ptr[bla - 1]);
        __syncthreads();
    }

    float candidate = fields[4 * (blockIdx.x * (fsx * fsy) + ids[0]) + 2];
    o_zvals[blockIdx.x] = (isnan(candidate) ? 0.0f : candidate) + correction;
}

void clear_pointcloud()
{
    if (d_fields != NULL)
    {
        cudaFree(d_fields);
        d_fields = NULL;
    }

    if (h_fields != NULL)
    {
        free(h_fields);
        h_fields = NULL;
    }

    if (d_zvals != NULL)
    {
        cudaFree(d_zvals);
        d_zvals = NULL;
    }

    if (h_zvals != NULL)
    {
        free(h_zvals);
        h_zvals = NULL;
    }

    if (d_fixedXs != NULL)
    {
        cudaFree(d_fixedXs);
        d_fixedXs = NULL;
    }

    if (d_fixedYs != NULL)
    {
        cudaFree(d_fixedYs);
        d_fixedYs = NULL;
    }
}

void init_pointcloud(const int res, const int fSX, const int fSY, const float minX, const float maxX, const float minY, const float maxY)
{
    if (d_fields != NULL || h_fields != NULL)
        clear_pointcloud();

    cudaDeviceReset();
    int *dev = (int *)malloc(sizeof(int));
    dev[0] = -99;
    cudaGetDevice(dev);
    std::cout << "Pointcloud cuda device: " << dev[0] << std::endl;
    free(dev);
    //pcl::pointXYZ is SSE aligned and therefor consists of float[4] with the last float just being padding.
    //thus we have to use more memory than necessary, but whatevs amirite
    cudaMalloc((void **)&d_fields, sizeof(float) * 4 * res * res * fSX * fSY);
    h_fields = (float *)malloc(sizeof(float) * 4 * res * res * fSX * fSY);

    cudaMalloc((void **)&d_zvals, sizeof(float) * res * res);
    h_zvals = (float *)malloc(sizeof(float) * res * res);

    cudaMalloc((void **)&d_fixedXs, sizeof(float) * res);
    cudaMalloc((void **)&d_fixedYs, sizeof(float) * res);

    for (int i = 0; i < res; i++)
    {
        float x = minX + (maxX - minX) * (float)i / (float)(res - 1);
        float y = minY + (maxY - minY) * (float)i / (float)(res - 1);
        cudaMemcpy(&d_fixedXs[i], &x, sizeof(float), cudaMemcpyHostToDevice);
        cudaMemcpy(&d_fixedYs[i], &y, sizeof(float), cudaMemcpyHostToDevice);
    }
}

//call with (float*)&(transformedPointcloud->points[0])
float *make_fields(const float *flattenedTransformedPointCloud,
                   const int width, const int res,
                   const int fSX, const int fSY,
                   const int fieldStartX, const int fieldStartY,
                   const int fieldOffsetX, const int fieldOffsetY,
                   const float minX, const float maxX,
                   const float minY, const float maxY)
{
    //reset memories if sizes have changed
    if (res != res_ || fSX != fSX_ || fSY != fSY_)
    {
        clear_pointcloud();
        init_pointcloud(res, fSX, fSY, minX, maxX, minY, maxY);
        res_ = res;
        fSX_ = fSX;
        fSY_ = fSY;
    }

    int offset = 0;
    for (int iY = 0; iY < res_; iY++)
    {
        for (int iX = 0; iX < res_; iX++)
        {
            for (int iiY = 0; iiY < fSY; iiY++)
            {
                const int hf = 4 * offset;
                const int ff = 4 * (width * (fieldStartY + (fieldOffsetY * iY) + iiY) + fieldStartX + iX * fieldOffsetX);
                memcpy(&h_fields[hf], &flattenedTransformedPointCloud[ff], sizeof(float) * 4 * fSX);
                offset += fSX;
            }
        }
    }

    return h_fields;
}

//fast and amazing CUDA version
float *get_Z_values(float correction)
{
    cudaMemcpy(d_fields, h_fields, sizeof(float) * 4 * fSX_ * fSY_ * res_ * res_, cudaMemcpyHostToDevice);
    cudaMemset(d_zvals, 0, sizeof(float) * res_ * res_);
    find_closest<<<res_ * res_, 1024>>>(fSX_, fSY_, res_, d_fields, d_fixedXs, d_fixedYs, d_zvals, correction);
    int err = cudaDeviceSynchronize();
    if (err != 0)
        std::cout << "POINTCLOUD CUDA ERROR: " << err << std::endl;

    cudaMemcpy(h_zvals, d_zvals, sizeof(float) * res_ * res_, cudaMemcpyDeviceToHost);
    return h_zvals;
}

//slow CPU version
float *get_Z_values(int res, int fSX, int fSY, float minX, float maxX, float minY, float maxY)
{
    for (int iY = 0; iY < res_; iY++)
    {

        float y = minY + (maxY - minY) * (float)iY / (float)(res - 1);

        for (int iX = 0; iX < res_; iX++)
        {
            float x = minX + (maxX - minX) * (float)iX / (float)(res - 1);
            float dist = 9999999.9;

            for (int i = 0; i < fSX * fSY; i++)
            {
                float pixX = h_fields[((iY * res_ + iX) * (fSX * fSY) + i) * 4];
                float pixY = h_fields[((iY * res_ + iX) * (fSX * fSY) + i) * 4 + 1];
                if (dist > (x - pixX) * (x - pixX) + (y - pixY) * (y - pixY))
                {
                    h_zvals[iY * res_ + iX] = h_fields[((iY * res_ + iX) * (fSX * fSY) + i) * 4 + 2];
                    dist = (x - pixX) * (x - pixX) + (y - pixY) * (y - pixY);
                }
            }
        }
    }
    return h_zvals;
}