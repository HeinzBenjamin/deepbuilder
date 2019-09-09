#include <ros/ros.h>
#include "deepbuilder/deepbuilder.h"
#include "deepbuilder/ro_gripper_open.h"
#include "deepbuilder/ro_gripper_close.h"
#include "deepbuilder/ro_gripper_moveto.h"
#include "deepbuilder/ro_gripper_setspeed.h"
#include "deepbuilder/ro_gripper_setforce.h"
#include <std_msgs/String.h>
#include <sensor_msgs/JointState.h>
#include <ur_msgs/SetIO.h>
#include <ur_msgs/IOStates.h>
#include <sstream>

#define COLOR termcolor::yellow

/** @brief This class controls the robotiq 85 gripper through UR3 controller via sockets.
	
	This class uses rostopics URDriver/URScript, and URDriver/IOstates and rosservice setIO to control robotiq 85 model gripper. This class publishes commands in ur script format to control the robotiq gripper. This class requires that the robotiq's URcaps is installed in the controller and that the URDriver/URScript in published. The execution verification is done through a configurable digital output named checkpoint this is why the class verifies the IO states.
	ur_driver, ur_msgs are comonents required.
	@author Barrero Lizarazo, Nicolas
	@date September 2018
	*/

class GripperUR
{
private:
	ros::NodeHandle n;
	ros::Publisher pub;
	ros::Subscriber sub;
	ros::ServiceClient client;

	std_msgs::String msg_out;
	ur_msgs::IOStates msg_in;
	ur_msgs::SetIO srv;

	const std::string HEADER = "def gripper_action():\n socket_close(\"G\")\n sync()\n socket_open(\"127.0.0.1\",63352,\"G\")\n sync()\n";
	std::string FEEDBACK; //const std::string FEEDBACK=" set_configurable_digital_out(7,True)\n"; Now you can change the configurable output.
	const std::string ENDING = " socket_close(\"G\")\nend\n";

	void reset()
	{
		command = HEADER;
		command += " socket_set_var(\"ACT\",0,\"G\")\n";
		command += " sync()\n";
		/*command+= " socket_set_var(\"GTO\",0,\"G\")\n"; Works better without this.
		command+= " sync()\n";
		command+= " socket_set_var(\"SPE\",0,\"G\")\n";
		command+= " sync()\n";
		command+= " socket_set_var(\"FOR\",0,\"G\")\n";
		command+= " sync()\n";
		command+= " socket_set_var(\"POS\",0,\"G\")\n";
		command+= " socket_set_var(\"PRE\",0,\"G\")\n";*/
		command += " sync()\n";
		command += " sleep(0.5)\n";
		command += FEEDBACK;
		command += ENDING;
		publisher();
		if (wait())
			init_ok = 0;
		updater();
	}

	bool wait()
	{
		int time = 0;
		while (!flag && ros::ok() && time < time_out)
		{
			ros::spinOnce();
			ros::Duration(0.25).sleep();
			time++;
		}
		if (time >= time_out)
		{
			ROS_ERROR("Command TIME OUT");
			return 0;
		}
		return 1;
	}

	void publisher()
	{
		msg_out.data = command;
		pub.publish(msg_out);
		command = "";
	}

	void updater()
	{
		if (!client.call(srv))
			ROS_ERROR("Unable to update controller data");
		ros::Duration(0.5).sleep();
		ros::spinOnce();
	}

	void writeFeedback(int id)
	{
		aux.str("");
		aux << " set_configurable_digital_out(" << id - 8 << ",True)\n";
		FEEDBACK = aux.str();
	}

	std::string writeSpeed()
	{
		aux.str("");
		aux << " socket_set_var(\"SPE\"," << speed << ",\"G\")\n";
		return aux.str();
	}

	std::string writeForce()
	{
		aux.str("");
		aux << " socket_set_var(\"FOR\"," << force << ",\"G\")\n";
		return aux.str();
	}

	std::string writePose(int pose)
	{
		aux.str("");
		if (pose > 255)
		{
			aux << " socket_set_var(\"POS\"," << 255 << ",\"G\")\n";
			ROS_WARN("Setting max valid position goal 255");
		}
		else if (pose < 0)
		{
			aux << " socket_set_var(\"POS\"," << 0 << ",\"G\")\n";
			ROS_WARN("Setting min valid position goal 0");
		}
		else
			aux << " socket_set_var(\"POS\"," << pose << ",\"G\")\n";
		return aux.str();
	}

	std::string writeTimeOut()
	{
		aux.str("");
		aux << " if(t>=" << time_out << "):\n";
		return aux.str();
	}

	std::string writeWhile(int pose, int t)
	{
		aux.str("");
		if (pose > 230)
			aux << " while (socket_get_var(\"POS\",\"G\")<" << 227 - t << " and socket_get_var(\"OBJ\",\"G\")!=1 and socket_get_var(\"OBJ\",\"G\")!=2 and t<" << time_out << "):\n";
		else if (pose < 3)
			aux << " while (socket_get_var(\"POS\",\"G\")>" << 3 + t << " and socket_get_var(\"OBJ\",\"G\")!=1 and socket_get_var(\"OBJ\",\"G\")!=2 and t<" << time_out << "):\n";
		else
			aux << " while ((socket_get_var(\"POS\",\"G\")<" << pose - t << " or socket_get_var(\"POS\",\"G\")>" << pose + t << ") and socket_get_var(\"OBJ\",\"G\")!=1 and socket_get_var(\"OBJ\",\"G\")!=2 and t<" << time_out << "):\n";
		return aux.str();
	}

	std::string writeWhileOpen()
	{
		aux.str("");
		aux << " while (socket_get_var(\"POS\",\"G\")>3 and socket_get_var(\"OBJ\",\"G\")!=1 and socket_get_var(\"OBJ\",\"G\")!=2 and t<" << time_out << "):\n";
		return aux.str();
	}

	std::string writeWhileClose()
	{
		aux.str("");
		aux << " while (socket_get_var(\"POS\",\"G\")<227 and socket_get_var(\"OBJ\",\"G\")!=1 and socket_get_var(\"OBJ\",\"G\")!=2 and t<" << time_out << "):\n";
		return aux.str();
	}

	bool flag;
	bool init_ok;
	int pinID;
	int speed;
	int force;
	int pose;
	int tolerance;
	int time_out;

	std::string command;
	std::stringstream aux;

public:
	/** The constructor initializes the subscriptor and publisher functions. Advertices the URdriver/URScript topic. Initialices variables.
	*/
	GripperUR()
	{
		pub = n.advertise<std_msgs::String>("/ur_driver/URScript", 5);
		sub = n.subscribe("/ur_driver/io_states", 10, &GripperUR::gripper85_statusCallback, this);
		client = n.serviceClient<ur_msgs::SetIO>("/ur_driver/set_io");
		ros::Duration(1.0).sleep();
		setCheckpointAddress();
		setTimeOut();
		setPoseTolerance();
		setSpeed();
		setForce();
		flag = 0;
		init_ok = 0;
		command = "";
	}

	/** This is the regular Callback from a ros node, this function updates the checkpoint data used as a feedback from the UR controller.
		@param msg is the message type the nodes subscribes to: const ur_msgs::IOStates::ConstPtr&
	*/

	void gripper85_statusCallback(const ur_msgs::IOStates::ConstPtr &msg_in)
	{
		flag = msg_in->digital_out_states[pinID].state;
	}

	/** The init function must be executed at first. It resets the gripper and executes the initialization routine. This function overrides other configured parameters previously defined. Once the init routine is done the gripper will move.
	*/
	void init()
	{
		reset();
		ROS_WARN("gripper initialization");
		command = HEADER;
		command += " socket_set_var(\"ACT\",1,\"G\")\n";
		command += " sync()\n";
		command += " t=0\n";
		command += " while (socket_get_var(\"STA\",\"G\")!=3 and t<25):\n";
		command += "  sync()\n";
		command += "  sleep(0.25)\n";
		command += "  t=t+1\n";
		command += " end\n";
		command += " if(t>=25):\n";
		command += "  popup(\"Something went wrong with gripper activation! TIME OUT\")\n";
		command += "  halt\n";
		command += " end\n";
		command += " socket_set_var(\"GTO\",1,\"G\")\n";
		command += " sync()\n";
		command += " socket_set_var(\"SPE\",255,\"G\")\n";
		command += " sync()\n";
		command += " socket_set_var(\"FOR\",0,\"G\")\n";
		command += " sync()\n";
		//command+= " sleep(0.5)\n";
		command += " socket_set_var(\"POS\",0,\"G\")\n";
		command += " sync()\n";
		command += " t=0\n";
		command += " while (socket_get_var(\"POS\",\"G\")>3 and t<25):\n";
		command += "  sync()\n";
		command += "  sleep(0.25)\n";
		command += "  t=t+1\n";
		command += " end\n";
		command += " if(t>=25):\n";
		command += "  popup(\"Something went wrong with gripper activation! TIME OUT\")\n";
		command += "  halt\n";
		command += " end\n";
		//command+= " sync()\n";
		command += FEEDBACK;
		command += ENDING;
		publisher();
		if (wait())
		{
			ROS_INFO("INIT OK");
			init_ok = 1;
		}
		updater();
	}

	/** This function opens the gripper.
	*/
	void open()
	{
		if (!init_ok)
		{
			ROS_WARN("Activate gripper first");
			goto end;
		}
		command = HEADER;
		command += writeSpeed();
		command += " sync()\n";
		command += writeForce();
		command += " sync()\n";
		command += " socket_set_var(\"POS\",0,\"G\")\n";
		command += " sync()\n";
		command += " t=0\n";
		command += writeWhileOpen();
		command += "  sync()\n";
		command += "  sleep(0.25)\n";
		command += "  t=t+1\n";
		command += " end\n";
		command += writeTimeOut();
		command += "  popup(\"TIME OUT\")\n";
		command += "  halt\n";
		command += " end\n";
		command += FEEDBACK;
		command += ENDING;
		publisher();
		if (wait())
			ROS_INFO("Gripper succesfully opened");
		updater();

	end:;
	}

	/** This function closes the gripper.
	*/
	void close()
	{
		if (!init_ok)
		{
			ROS_WARN("Activate gripper first");
			goto end;
		}
		command = HEADER;
		command += writeSpeed();
		command += " sync()\n";
		command += writeForce();
		command += " sync()\n";
		command += " socket_set_var(\"POS\",255,\"G\")\n";
		command += " sync()\n";
		command += " t=0\n";
		command += writeWhileClose();
		command += "  sync()\n";
		command += "  sleep(0.25)\n";
		command += "  t=t+1\n";
		command += " end\n";
		command += writeTimeOut();
		command += "  popup(\"TIME OUT\")\n";
		command += "  halt\n";
		command += " end\n";
		command += FEEDBACK;
		command += ENDING;
		publisher();
		if (wait())
			ROS_INFO("Gripper succesfully closed");
		updater();

	end:;
	}

	/** This function moves the gripper to a given position between 0-255. It executes the trayectory and waits until the goal is reached. If an object is detected the gripper stops the movement, should be called after init()
		@param goal 0-255 where 0 is totally open and 255 totally closed
	*/
	void moveto(int goal)
	{
		if (!init_ok)
		{
			ROS_WARN("Activate gripper first");
			goto end;
		}
		command = HEADER;
		command += writeSpeed();
		command += " sync()\n";
		command += writeForce();
		command += " sync()\n";
		command += writePose(goal);
		command += " sync()\n";
		command += " t=0\n";
		command += writeWhile(goal, tolerance);
		command += "  sync()\n";
		command += "  sleep(0.25)\n";
		command += "  t=t+1\n";
		command += " end\n";
		command += writeTimeOut();
		command += "  popup(\"TIME OUT\")\n";
		command += "  halt\n";
		command += " end\n";
		command += FEEDBACK;
		command += ENDING;
		publisher();
		if (wait())
		{
			if (goal > 255)
				ROS_INFO("Gripper pose goal: %i reached", 255);
			else if (goal < 0)
				ROS_INFO("Gripper pose goal: %i reached", 0);
			else
				ROS_INFO("Gripper pose goal: %i reached", goal);
		}
		updater();

	end:;
	}

	/**This function sets gripper's speed
		@param int speed 0-255 where 255 is max speed (default 255)
	*/
	void setSpeed(int s = 255)
	{
		if (s > 255)
			speed = 255;
		else if (s < 0)
			speed = 0;
		else
			speed = s;
		ROS_INFO("Current gripper speed->%i", speed);
	}

	/**This function sets gripper's force
		@param int force 0-255 where 255 is max force (default 0)
	*/
	void setForce(int f = 0)
	{
		if (f > 255)
			force = 255;
		else if (f < 0)
			force = 0;
		else
			force = f;
		ROS_INFO("Current gripper force->%i", force);
	}
	/**This function sets gripper's pose tolerance +/- (default 0)
		@param int tolerance en 0-255 units.
	*/
	void setPoseTolerance(int t = 0)
	{
		tolerance = t;
		ROS_INFO("Pose Tolerance->%i", tolerance);
	}

	/**This function sets controller time out (default 8s)
		@param int waiting time in seconds
	*/
	void setTimeOut(int t = 8)
	{
		if (t > 0)
			time_out = t / 0.25;
		else
			time_out = 8;
		ROS_INFO("Gripper's time out set to %i seconds", t);
	}

	/**This function sets checkpoint address used for feedback. Only digital addresses are avaible: from 2x00 to 2x07. (default 2x07)
		@param int Address ID from 8->2x00 to 15->2x07
	*/
	void setCheckpointAddress(int address = 15)
	{
		if (address > 15 || address < 8)
		{
			srv.request.fun = 1;
			srv.request.pin = 15;
			srv.request.state = 0;
			pinID = 15;
			writeFeedback(pinID);
			ROS_WARN("Invalid Address, setting default address 2x07 instead.\n Only configurable outputs IDs 8 to 15 available");
		}
		else
		{
			srv.request.fun = 1;
			srv.request.pin = address;
			srv.request.state = 0;
			pinID = address;
			writeFeedback(pinID);
			if (pinID != 15)
				ROS_INFO("Checkpoint address changed to %i", address);
			else
				ROS_INFO("Default Checkpoint Address 2x07");
		}
	}

	/**Gets the current gripper's speed
		@return int 0-255 see setSpeed()
	*/
	int getSpeed()
	{
		return speed;
	}
	/**Gets the current gripper's force
		@return int 0-255 see setForce()
	*/
	int getForce()
	{
		return force;
	}

	/**Gets the current gripper's pose tolerance
		@return int 0-255 see setPoseTolerance()
	*/
	int getPoseTolerance()
	{
		return tolerance;
	}

	/**Gets the current waiting time 
		@return int seconds see setTimeOut()
	*/
	int getTimeOut()
	{
		return time_out * 0.25;
	}

	/**Gets the current output address used as checkpoint 
		@return int from 8->2x00 to 15->2x07 see setCheckpointAddress()
	*/
	int getCheckpointAddress()
	{
		return pinID;
	}
};

GripperUR* G = NULL;

bool OpenCallback(deepbuilder::ro_gripper_openRequest &req, deepbuilder::ro_gripper_openResponse &res){
	G->open();
	res.message = "SUCCESS";
	return true;
}

bool CloseCallback(deepbuilder::ro_gripper_closeRequest &req, deepbuilder::ro_gripper_closeResponse &res){
	G->close();
	res.message = "SUCCESS";
	return true;
}

bool MoveToCallback(deepbuilder::ro_gripper_movetoRequest &req, deepbuilder::ro_gripper_movetoResponse &res){
	G->moveto(req.goal);
	res.message = "SUCCESS";
	return true;
}

bool SetSpeedCallback(deepbuilder::ro_gripper_setspeedRequest &req, deepbuilder::ro_gripper_setspeedResponse &res){
	G->setSpeed(req.speed);
	res.message = "SUCCESS";
	return true;
}

bool SetForceCallback(deepbuilder::ro_gripper_setforceRequest &req, deepbuilder::ro_gripper_setforceResponse &res){
	G->setForce(req.force);
	res.message = "SUCCESS";
	return true;
}





int main(int argc, char **argv)
{
	PRINT_BOLD("--- Deep Builder Gripper STARTUP ---");
	ros::init(argc, argv, "db_gripper");
	
	GripperUR g;
	g.init();
	G = &g;

	ros::NodeHandle nh;
	ros::ServiceServer open_serv = nh.advertiseService("deepbuilder/gripper/open", OpenCallback);
	ros::ServiceServer close_serv = nh.advertiseService("deepbuilder/gripper/close", CloseCallback);
	ros::ServiceServer moveto_serv = nh.advertiseService("deepbuilder/gripper/moveto", MoveToCallback);
	ros::ServiceServer speed_serv = nh.advertiseService("deepbuilder/gripper/setspeed", SetSpeedCallback);
	ros::ServiceServer force_serv = nh.advertiseService("deepbuilder/gripper/setforce", SetForceCallback);


/*
	ros::Publisher pub = nh.advertise<sensor_msgs::JointState>("/joint_states", 1);
	sensor_msgs::JointState joint_msg;
	joint_msg.name.push_back("finger_joint");
	joint_msg.name.push_back("left_inner_knuckle_joint");
	joint_msg.name.push_back("left_inner_finger_joint");
	joint_msg.name.push_back("right_outer_knuckle_joint");
	joint_msg.name.push_back("right_inner_knuckle_joint");
	joint_msg.name.push_back("right_inner_finger_joint");

	joint_msg.position.push_back(0.0);
	joint_msg.position.push_back(0.0);
	joint_msg.position.push_back(0.0);
	joint_msg.position.push_back(0.0);
	joint_msg.position.push_back(0.0);
	joint_msg.position.push_back(0.0);

while(ros::ok()){
	ROS_INFO("FUCK OFFF");
	pub.publish(joint_msg);


	ros::spinOnce();
	}
	*/


ros::spin();
}

#undef COLOR