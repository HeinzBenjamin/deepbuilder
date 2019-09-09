#pragma once
#include "deepbuilder.h"

#define COLOR termcolor::dark

//if a node is currently running in ROS, this will return true
bool IsNodeAlive(const std::string &node)
{
    std::vector<std::string> v;
    ros::master::getNodes(v);
    return std::find(v.begin(), v.end(), node) != v.end();
}

bool IsRosbridgeClientConnected(const std::string &ip)
{
    boost::shared_ptr<rosbridge_msgs::ConnectedClients const> ptr;

    ptr = ros::topic::waitForMessage<rosbridge_msgs::ConnectedClients>("/connected_clients");
    if (ptr == NULL)
        return false;

    else
    {
        for (const rosbridge_msgs::ConnectedClient &client : ptr->clients)
            if (client.ip_address == ip)
                return true;
    }

    return false;
}

//this will keep checking if a node is alive until timeoutMs is hit
void WaitForNode(const std::string &node, int waitIntervalMs = 1000, int timeoutMs = 60000)
{
    PRINT("Waiting for node " + node);

    auto start = std::chrono::high_resolution_clock::now();
    while (
        ros::ok() &&
        !IsNodeAlive(node) &&
        std::chrono::duration_cast<std::chrono::milliseconds>(std::chrono::high_resolution_clock::now() - start).count() < timeoutMs)
    {
        //PRINT("...");
        std::this_thread::sleep_for(std::chrono::milliseconds(waitIntervalMs));
    }
    if (!ros::ok())
    {
        PRINT_BOLD("Cancelled. ROS is broken!");
        return;
    }

    PRINT(node + " found!");
}

void WaitForRosbridgeClient(const std::string &ip, int waitIntervalMs = 100, int timeoutMs = 500)
{
    auto start = std::chrono::high_resolution_clock::now();
    while (
        ros::ok() &&
        !IsRosbridgeClientConnected(ip) &&
        std::chrono::duration_cast<std::chrono::milliseconds>(std::chrono::high_resolution_clock::now() - start).count() < timeoutMs)
    {
        std::this_thread::sleep_for(std::chrono::milliseconds(waitIntervalMs));
    }

    if (IsRosbridgeClientConnected(ip))
        PRINT("GH found at: " + ip);
}

#undef COLOR