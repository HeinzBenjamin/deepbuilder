#include "deepbuilder/deepbuilder.h"
#include "deepbuilder/util.h"
#include "deepbuilder/rt_status.h"
#include "deepbuilder/rt_is_ready.h"
#include "deepbuilder/rt_wait_for_ready.h"
#include "deepbuilder/rt_set_state.h"
#include "deepbuilder/rt_set_action.h"
#include "deepbuilder/rt_get_status.h"
#include "deepbuilder/rt_set_agent_presence.h"
#include "std_msgs/String.h"

#define COLOR termcolor::blue

#pragma region global vars
//some main arguments and global stuff
bool needsGhEnvironment_ = true;
bool needsRosbridge_ = needsGhEnvironment_;
bool is_ready_ = false;
int msg_freq = 1000;
std::string gh_ip_;
double ROSRATE = 20.0;

//this is the all mighty status object. this is whatever gets published to and subscribed from
deepbuilder::rt_status status_;

deepbuilder::rt_status DefaultStatus()
{
    deepbuilder::rt_status rts;
    rts.ros_tick = 0;
    rts.current_controller = "runtime";
    rts.gh_present = false;
    rts.agent_present = false;
    return rts;
}

#pragma endregion

#pragma region service_callbacks
//returns is_ready_ to service. is_ready_ is being set in the main function, after getting in contact with clients
bool IsReadyCallback(deepbuilder::rt_is_ready::Request &req, deepbuilder::rt_is_ready::Response &res)
{
    res.ready = is_ready_;
    std::cout << COLOR << "deepbuilder/runtime: is_ready request evaluated to " << is_ready_ << NO_COLOR << std::endl;
    return true;
}

//loops until is_ready_ is true. if timeout_ms is hit, request is aborted
bool WaitForReadyCallback(deepbuilder::rt_wait_for_ready::Request &req, deepbuilder::rt_wait_for_ready::Response &res)
{
    int64_t timeoutMs = req.timeout_ms;
    auto start = std::chrono::high_resolution_clock::now();
    while (!is_ready_ && std::chrono::duration_cast<std::chrono::milliseconds>(std::chrono::high_resolution_clock::now() - start).count() < timeoutMs)
    {
    }
    res.ready = is_ready_;
    std::cout << COLOR << "deepbuilder/runtime: wait_for_ready request evaluated to " << (is_ready_ ? "TRUE" : "FALSE") << NO_COLOR << std::endl;
    return is_ready_;
}

bool SetStateCallback(deepbuilder::rt_set_state::Request &req, deepbuilder::rt_set_state::Response &res)
{
    if (status_.state.action_id != req.state.action_id)
    {
        PRINT("State updated:");
        PRINT("Controller: " + req.controller);
        PRINT("Action ID: " + req.state.action_id);
        PRINT("Out of reach: " + req.state.out_of_reach);
        PRINT("Self collision: " + req.state.self_collision);
        PRINT("Fastest box: " + req.state.fastest_box);
        PRINT("Highest box: " + req.state.highest_box);
        PRINT("Current height: ");
        PRINT(req.state.current_height);
        PRINT("Num box: " + req.state.box_poses.size());
    }
    else
    {
        PRINT("Minor state update");
    }

    status_.current_controller = req.controller;
    status_.state = req.state;

    return true;
}

bool SetActionCallback(deepbuilder::rt_set_action::Request &req, deepbuilder::rt_set_action::Response &res)
{
    status_.current_controller = req.controller;
    status_.action = req.action;
    PRINT("Action update:");
    PRINT(req.controller);
    PRINT(req.action);
    return true;
}

bool GetStatusCallback(deepbuilder::rt_get_status::Request &req, deepbuilder::rt_get_status::Response &res)
{
    res.status = status_;
    return true;
}

bool SetAgentPresenceCallback(deepbuilder::rt_set_agent_presence::Request &req, deepbuilder::rt_set_agent_presence::Response &res)
{
    status_.agent_present = req.agent_present;
    return true;
}

#pragma endregion

int main(int argc, char **argv)
{
    //normal initialisation
    ros::init(argc, argv, "db_runtime"); //name here doesn't matter, as it's overwritten by launch file
    PRINT_BOLD("--- Deep Builder Runtime STARTUP ---");
    ros::NodeHandle nh;

    //publisher for runtime status
    ros::Publisher status_pub = nh.advertise<deepbuilder::rt_status>("deepbuilder/runtime/status", 50);
    ros::Publisher action_pub = nh.advertise<my_msgs::action>("deepbuilder/runtime/status/action", 10);
    ros::Publisher state_pub = nh.advertise<my_msgs::state>("deepbuilder/runtime/status/state", 10);

    status_ = DefaultStatus();
    status_pub.publish(status_);
    action_pub.publish(status_.action);
    state_pub.publish(status_.state);
    PRINT_BOLD(ROSRATE);
    ros::Rate rosRate(ROSRATE);

    //advertising services so clients can get immediate feedback after connecting
    //this is only important for establishing first connections
    ros::ServiceServer ir_serv = nh.advertiseService("deepbuilder/runtime/is_ready", IsReadyCallback);
    ros::ServiceServer wr_serv = nh.advertiseService("deepbuilder/runtime/wait_for_ready", WaitForReadyCallback);

    //advertise services to change internal runtime state
    //while action and state are set from outsiders seperately (while identifying themselves as controller)...
    //...Only one Get command gets all the info about current runtime status, including state, action, and the rest
    ros::ServiceServer ss_serv = nh.advertiseService("deepbuilder/runtime/set_state", SetStateCallback);
    ros::ServiceServer sa_serv = nh.advertiseService("deepbuilder/runtime/set_action", SetActionCallback);
    ros::ServiceServer gs_serv = nh.advertiseService("deepbuilder/runtime/get_status", GetStatusCallback);

    //service letting learner tell me if the agent is present
    ros::ServiceServer ap_serv = nh.advertiseService("deepbuilder/runtime/set_agent_presence", SetAgentPresenceCallback);

    //wait for rosbridge to be ready
    if (needsRosbridge_)
        WaitForNode("/rosbridge_server");

    //wait for a rosbridge client connecting from ip address gh_ip_
    if (needsGhEnvironment_)
    {
        PRINT("Grasshopper client expected at: ");
        PRINT(argv[1]);
        gh_ip_ = argv[1];
        PRINT("Checking Grasshopper connection...");
        WaitForRosbridgeClient(gh_ip_);
    }

    while (ros::ok())
    {
        status_.gh_present = IsRosbridgeClientConnected(gh_ip_);

        status_pub.publish(status_);
        action_pub.publish(status_.action);
        state_pub.publish(status_.state);

        is_ready_ = true;
        ros::spinOnce();
        status_.ros_tick++;
    }

    is_ready_ = false;
    PRINT_BOLD("deepbuilder runtime is NOT okay! Exiting...");
    return 1;
}

#undef COLOR