#include "deepbuilder/deepbuilder.h"
#include "deepbuilder/util.h"
// PCL specific includes
#include <pcl_conversions/pcl_conversions.h>
#include <pcl_ros/transforms.h>
#include <pcl_ros/point_cloud.h>
#include <pcl/point_types.h>
#include <pcl/point_cloud.h>
#include <sensor_msgs/PointCloud2.h>
#include <my_msgs/float_array.h>
#include <tf/transform_listener.h>
#include <geometry_msgs/Point.h>
#include <std_msgs/ColorRGBA.h>
#include <visualization_msgs/MarkerArray.h>
#include <visualization_msgs/Marker.h>
#include <deepbuilder/se_adjust_resolution.h>
#include <deepbuilder/se_adjust_fieldsize_x.h>
#include <deepbuilder/se_adjust_fieldsize_y.h>
#include <deepbuilder/se_adjust_field_offset_x.h>
#include <deepbuilder/se_adjust_field_offset_y.h>
#include <deepbuilder/se_adjust_field_start_x.h>
#include <deepbuilder/se_adjust_field_start_y.h>
#include <deepbuilder/se_adjust_correction.h>
#include <string>
#include <cmath>

#define COLOR termcolor::red

#pragma region typedefs
typedef pcl::PointCloud<pcl::PointXYZ> PointCloud;
typedef geometry_msgs::Point Point;
typedef std_msgs::ColorRGBA Color;
typedef my_msgs::float_array float_array;
typedef visualization_msgs::Marker Marker;
typedef visualization_msgs::MarkerArray MarkerArray;
#pragma endregion

#pragma region forward definitions of relevant depth_cloud.cu functions
void clear_pointcloud();

void init_pointcloud(const int resolution, const int fieldSizeX, const int fieldSizeY,
                     const float minX, const float maxX,
                     const float minY, const float maxY);

float *make_fields(const float *flattenedTransformedPointcloud,
                   const int width, const int resolution,
                   const int fieldSizeX, const int fieldSizeY,
                   const int fieldStartX, const int fieldStartY,
                   const int fieldOffsetX, const int fieldOffsetY,
                   const float minX, const float maxX,
                   const float minY, const float maxY);

//float *get_Z_values(int res, int fSX, int fSY, float minX, float maxX, float minY, float maxY);
float *get_Z_values(float correction);
#pragma endregion

#pragma region properties
//ros related stuff
ros::Publisher vals_pub;
ros::Publisher marker_pub;
tf::TransformListener *tf_listener;
const std::string frame = "base";

//playfield dimensions
const int numPixels = 640 * 480;
const float minX = 0.373;
const float maxX = -0.378;
const float minY = -1.0215;
const float maxY = -0.2755;

//volatile
int resolution_ = 12;
int fieldSizeX_ = 32;
int fieldSizeY_ = 32;
int fieldStartX_ = 156;
int fieldStartY_ = 4;
int fieldOffsetX_ = 26;
int fieldOffsetY_ = 25;
float correction_ = 0.0f;
#pragma endregion

#pragma region output buffers
//flattened fields x, y, z, sse_padding - float[4]
float *fields_;
float *selectedZValues_;

std::vector<Marker> FieldMarkers;
std::vector<Marker> TextMarkers;
Marker TextPointMarker;
#pragma endregion

void InitTextMarkers()
{
  TextPointMarker = Marker();
  TextPointMarker.type = Marker::POINTS;
  TextPointMarker.action = Marker::ADD;
  TextPointMarker.header.frame_id = frame;
  TextPointMarker.header.stamp = ros::Time::now();
  TextPointMarker.ns = "sensing-text-pt";
  TextPointMarker.id = 0;
  TextPointMarker.pose.orientation.w = 1.0f;
  TextPointMarker.scale.x = 0.01f;
  TextPointMarker.scale.y = 0.01f;
  TextPointMarker.scale.z = 0.01f;
  TextPointMarker.lifetime = ros::Duration();

  TextMarkers = std::vector<Marker>(resolution_ * resolution_);
  for (int iterY = 0; iterY < resolution_; iterY++)
  {
    for (int iterX = 0; iterX < resolution_; iterX++)
    {
      int id = iterY * resolution_ + iterX;
      Marker m;
      m.type = Marker::TEXT_VIEW_FACING;
      m.action = Marker::ADD;
      m.header.frame_id = frame;
      m.header.stamp = ros::Time::now();
      m.ns = "sensing-text";
      m.id = id;
      m.pose.position.x = minX + ((maxX - minX) * ((float)iterX / (float)(resolution_ - 1)));
      m.pose.position.y = minY + ((maxY - minY) * ((float)iterY / (float)(resolution_ - 1)));
      m.pose.position.z = 0.0f;
      m.pose.orientation.w = 1.0f;
      m.scale.x = 0.03;
      m.scale.y = 0.03;
      m.scale.z = 0.03;
      m.color.r = 0.3f * (float)iterX / (float)resolution_;
      m.color.g = 0.3f * (float)iterY / (float)resolution_;
      m.color.b = 0.3f;
      m.color.a = 1.0f;
      m.text = std::to_string(id);
      m.lifetime = ros::Duration();
      TextMarkers[id] = m;

      Point p;
      p.x = minX + ((maxX - minX) * ((float)iterX / (float)(resolution_ - 1)));
      p.y = minY + ((maxY - minY) * ((float)iterY / (float)(resolution_ - 1)));
      p.z = 0.0f;
      Color c;
      c.r = 0.3f * (float)iterX / (float)resolution_;
      c.g = 0.3f * (float)iterY / (float)resolution_;
      c.b = 0.3f;
      c.a = 1.0f;
      TextPointMarker.points.push_back(p);
      TextPointMarker.colors.push_back(c);
    }
  }
}

void InitFieldMarkers()
{
  FieldMarkers = std::vector<Marker>(resolution_ * resolution_);
  for (int iterY = 0; iterY < resolution_; iterY++)
  {
    for (int iterX = 0; iterX < resolution_; iterX++)
    {
      int id = iterY * resolution_ + iterX;
      Marker m;
      m.type = Marker::POINTS;
      m.action = Marker::ADD;
      m.header.frame_id = frame;
      m.header.stamp = ros::Time::now();
      m.ns = "sensing-pts";
      m.id = id;
      m.pose.orientation.w = 1.0f;
      m.scale.x = 0.002;
      m.scale.y = 0.002;
      m.scale.z = 0.002;
      m.points = std::vector<Point>(fieldSizeX_ * fieldSizeY_);
      m.color.r = (float)iterX / (float)resolution_;
      m.color.g = (float)iterY / (float)resolution_;
      m.color.b = 1.0f;
      m.color.a = 0.8f;
      m.lifetime = ros::Duration();
      FieldMarkers[id] = m;
    }
  }
}

void RepositionTextMarkers()
{
  const int fieldOffset = fieldSizeX_ * fieldSizeY_;
  for (int i = 0; i < resolution_ * resolution_; i++)
  {
    if (!std::isnan(selectedZValues_[i]))
    {
      TextMarkers[i].pose.position.z = selectedZValues_[i]+0.01;
      TextPointMarker.points[i].z = selectedZValues_[i];
    }
  }
}

void RepositionFieldMarkers()
{
  //iter through fields Y
  for (int iY = 0; iY < resolution_; iY++)
  {
    //iter through fields X
    for (int iX = 0; iX < resolution_; iX++)
    {
      int id = iY * resolution_ + iX; //id of field
      for (int i = 0; i < fieldSizeX_ * fieldSizeY_; i++)
      {
        int f = id * fieldSizeX_ * fieldSizeY_ + i;

        if (std::isnan(fields_[f * 4]) || std::isnan(fields_[f * 4 + 1]) || std::isnan(fields_[f * 4 + 2]))
          continue;

        FieldMarkers[id].points[i].x = fields_[f * 4];
        FieldMarkers[id].points[i].y = fields_[f * 4 + 1];
        FieldMarkers[id].points[i].z = fields_[f * 4 + 2] + correction_;
      }
    }
  }
}

void cloud_cb(const PointCloud &pCloud)
{
  PointCloud transformedCloud;

  pcl_ros::transformPointCloud(frame, pCloud, transformedCloud, *tf_listener);
  if (transformedCloud.points.size() != numPixels)
    return;

  std::reverse(transformedCloud.points.begin(), transformedCloud.points.end());
  MarkerArray mArray;
  //float_array output;

  if (TextMarkers.size() != resolution_ * resolution_)
    InitTextMarkers();

  if (FieldMarkers.size() != resolution_ * resolution_ || FieldMarkers[0].points.size() != fieldSizeX_ * fieldSizeY_)
    InitFieldMarkers();

  fields_ = make_fields((float *)&transformedCloud.points[0],
                        transformedCloud.width, resolution_,
                        fieldSizeX_, fieldSizeY_,
                        fieldStartX_, fieldStartY_,
                        fieldOffsetX_, fieldOffsetY_,
                        minX, maxX, minY, maxY);

  //selectedZValues_ = get_Z_values(resolution_, fieldSizeX_, fieldSizeY_, minX, maxX, minY, maxY); //would be CPU version
  selectedZValues_ = get_Z_values(correction_);

  float_array vals;
  vals.values = std::vector<float>(selectedZValues_, selectedZValues_ + resolution_ * resolution_);

  vals_pub.publish(vals);

  RepositionTextMarkers();
  RepositionFieldMarkers();

  mArray.markers.insert(mArray.markers.end(), TextMarkers.begin(), TextMarkers.end());
  mArray.markers.insert(mArray.markers.end(), FieldMarkers.begin(), FieldMarkers.end());
  mArray.markers.push_back(TextPointMarker);
  // Publish the data
  marker_pub.publish(mArray);
}

#pragma region servicecallbacks
bool AdjustResolutionCb(deepbuilder::se_adjust_resolution::Request &req, deepbuilder::se_adjust_resolution::Response &res)
{
  res.oldValue = resolution_;
  resolution_ = req.value;
  res.newValue = resolution_;
  PRINT(("Adjusted resolution from " + std::to_string(res.oldValue) + " to " + std::to_string(res.newValue)));
  return true;
}

bool AdjustFieldsizeXCb(deepbuilder::se_adjust_fieldsize_x::Request &req, deepbuilder::se_adjust_fieldsize_x::Response &res)
{
  res.oldValue = fieldSizeX_;
  fieldSizeX_ = req.value;
  res.newValue = fieldSizeX_;
  PRINT(("Adjusted fieldSizeX from " + std::to_string(res.oldValue) + " to " + std::to_string(res.newValue)));
  return true;
}

bool AdjustFieldsizeYCb(deepbuilder::se_adjust_fieldsize_y::Request &req, deepbuilder::se_adjust_fieldsize_y::Response &res)
{
  res.oldValue = fieldSizeY_;
  fieldSizeY_ = req.value;
  res.newValue = fieldSizeY_;
  PRINT(("Adjusted fieldSizeY from " + std::to_string(res.oldValue) + " to " + std::to_string(res.newValue)));
  return true;
}

bool AdjustFieldOffsetXCb(deepbuilder::se_adjust_field_offset_x::Request &req, deepbuilder::se_adjust_field_offset_x::Response &res)
{
  res.oldValue = fieldOffsetX_;
  fieldOffsetX_ = req.value;
  res.newValue = fieldOffsetX_;
  PRINT(("Adjusted fieldOffsetX from " + std::to_string(res.oldValue) + " to " + std::to_string(res.newValue)));
  return true;
}

bool AdjustFieldOffsetYCb(deepbuilder::se_adjust_field_offset_y::Request &req, deepbuilder::se_adjust_field_offset_y::Response &res)
{
  res.oldValue = fieldOffsetY_;
  fieldOffsetY_ = req.value;
  res.newValue = fieldOffsetY_;
  PRINT(("Adjusted fieldOffsetY from " + std::to_string(res.oldValue) + " to " + std::to_string(res.newValue)));
  return true;
}

bool AdjustFieldStartXCb(deepbuilder::se_adjust_field_start_x::Request &req, deepbuilder::se_adjust_field_start_x::Response &res)
{
  res.oldValue = fieldStartX_;
  fieldStartX_ = req.value;
  res.newValue = fieldStartX_;
  PRINT(("Adjusted fieldStartX from " + std::to_string(res.oldValue) + " to " + std::to_string(res.newValue)));
  return true;
}

bool AdjustFieldStartYCb(deepbuilder::se_adjust_field_start_y::Request &req, deepbuilder::se_adjust_field_start_y::Response &res)
{
  res.oldValue = fieldStartY_;
  fieldStartY_ = req.value;
  res.newValue = fieldStartY_;
  PRINT(("Adjusted fieldStartY from " + std::to_string(res.oldValue) + " to " + std::to_string(res.newValue)));
  return true;
}

bool AdjustCorrectionCb(deepbuilder::se_adjust_correction::Request &req, deepbuilder::se_adjust_correction::Response &res)
{
  res.oldValue = correction_;
  correction_ = req.value;
  res.newValue = correction_;
  PRINT(("Adjusted correction from " + std::to_string(res.oldValue) + " to " + std::to_string(res.newValue)));
  return true;
}
#pragma endregion

int main(int argc, char **argv)
{
  // Initialize ROS
  PRINT_BOLD("--- Deep Builder DEPTH CLOUD STARTUP ---");
  ros::init(argc, argv, "/deepbuilder/sensing/vision");
  ros::NodeHandle nh;
  tf::TransformListener tf;
  tf_listener = &tf;

  //ros::Subscriber sub = nh.subscribe("/camera/depth_registered/points", 1, cloud_cb);
  ros::Subscriber sub = nh.subscribe("/deepbuilder/sensing/point_cloud_xyz_raw", 1, cloud_cb);

  vals_pub = nh.advertise<float_array>("/deepbuilder/sensing/values", 1);
  marker_pub = nh.advertise<visualization_msgs::MarkerArray>("/deepbuilder/sensing/depthcloud/fields", 1);

  PRINT_BOLD("Allocating GPU memory for deepbuilder's vision pointcloud");
  init_pointcloud(resolution_, fieldSizeX_, fieldSizeY_, minX, maxX, minY, maxY);

  InitTextMarkers();
  InitFieldMarkers();

  ros::ServiceServer srv = nh.advertiseService("deepbuilder/sensing/adjust_resolution", AdjustResolutionCb);
  ros::ServiceServer srv0 = nh.advertiseService("deepbuilder/sensing/adjust_fieldsize_x", AdjustFieldsizeXCb);
  ros::ServiceServer srv1 = nh.advertiseService("deepbuilder/sensing/adjust_fieldsize_y", AdjustFieldsizeYCb);
  ros::ServiceServer srv2 = nh.advertiseService("deepbuilder/sensing/adjust_field_offset_x", AdjustFieldOffsetXCb);
  ros::ServiceServer srv3 = nh.advertiseService("deepbuilder/sensing/adjust_field_offset_y", AdjustFieldOffsetYCb);
  ros::ServiceServer srv4 = nh.advertiseService("deepbuilder/sensing/adjust_field_start_x", AdjustFieldStartXCb);
  ros::ServiceServer srv5 = nh.advertiseService("deepbuilder/sensing/adjust_field_start_y", AdjustFieldStartYCb);
  ros::ServiceServer srv6 = nh.advertiseService("deepbuilder/sensing/adjust_correction", AdjustCorrectionCb);

  // Spin
  ros::spin();

  PRINT_BOLD("Clearing deepbuilder's vision pointcloud");
  clear_pointcloud();
}

#undef COLOR