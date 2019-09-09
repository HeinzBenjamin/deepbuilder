#!/usr/bin/env python
'''
this is the ROS node that offers service calls 
it is started upon roslaunch
and uses learning_environment/env_socket_server.py to communicate
with learning_ws env_socket_client
'''
import sys, rospy, time, socket, pickle, requests
from my_msgs.msg import state as ROS_state
from std_msgs.msg import String
from geometry_msgs.msg import Pose
from termcolor import colored, cprint
from deepbuilder_py import Msgs as m
from deepbuilder.srv import *


HOST = 'localhost'              # Symbolic name meaning all available interfaces
PORT = 65432                    # Arbitrary non-privileged port
BUF_SIZE_ACT=1024               # will only receive action, this shouldn't require much
AWAIT_ACTION_RESPONSE = True    #is false, learner will not wait for action response an

class Learner():
    def __init__(self):
        #create service proxies object that can be used to make service calls to deepbuilder runtime
        self.set_action_srv_proxy = rospy.ServiceProxy('/deepbuilder/runtime/set_action', deepbuilder.srv.rt_set_action)
        self.set_state_srv_proxy = rospy.ServiceProxy('/deepbuilder/runtime/set_state', deepbuilder.srv.rt_set_state)
        self.set_agent_presence_srv_proxy = rospy.ServiceProxy('/deepbuilder/runtime/set_agent_presence', deepbuilder.srv.rt_set_agent_presence)
        self.connection = {}      

    def start(self):
        #name here doesn't matter, as it's overwritten by launch file
        print colored("--- Deep Builder Learner STARTUP ---", 'green')
        rospy.init_node('db_learner')
        
        #loop of ROS lifetime
        while not rospy.is_shutdown():
            #Setting up socket so its ready to listen
            print colored('Setting up socket to receive learner info at '+ str(HOST) + ':' + str(PORT), 'green')   
            sock=socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            sock.bind((HOST, PORT))
            sock.listen(1)  
            self.connection, addr = sock.accept()
            
            #loop of connection lifetime
            while not rospy.is_shutdown():

                #check if agent is still alive
                #if not, reset socket object
                if not self.AgentAlive():
                    print colored(">Resetting connection", 'red')
                    break             
                
                #actually receive stuff
                data = self.connection.recv(BUF_SIZE_ACT)
                if not data:
                    print colored(">Agent sent empty action. Resetting connection", 'red')
                    self.set_agent_presence_srv_proxy(agent_present=False)
                    break
                else:
                    d = pickle.loads(str(data))
                    if isinstance(d, m.action):
                        print colored(">Forwarding New Action: "+ d.id, 'green')
                        self.set_action_srv_proxy(controller='learner',action=data)
                    elif isinstance(d, m.state):
                        print colored(">Forwarding New State: "+ d.id, 'green')
                        self.set_state_srv_proxy(controller='learner',state=d)
                    else:
                        print colored(">Agent sent invalid action. We'll just ignore that", 'green')

            try:
                self.set_agent_presence_srv_proxy(agent_present=False)
                print colored(">Trying to shut down learner connection", 'green')
                sock.shutdown('SHUT_RDWR')
            except:
                print colored(">Couldn't shut down learner connection", 'red')


    def GetNewBlock(self):
        pass

    def AgentAlive(self):
        try:
            self.connection.send(str(b"ping"))
            self.set_agent_presence_srv_proxy(agent_present=True)
            return True
        except:
            print colored(">Agent is gone.", 'red')
            self.set_agent_presence_srv_proxy(agent_present=False)
            self.set_action_srv_proxy(controller='learner',action=None)
            return False

if __name__ == "__main__":
    #subscribe to state
    learner = Learner()
    learner.start()