#!/usr/bin/env python
import rospy, settings, json, time
from termcolor import colored
from deepbuilder.srv import *
import twincat_control as tc


def change_temp(req):
    robot_config = settings.ROBOT_CONFIG()    
    res = ex_change_tempResponse()
    res.message = "SUCCESS"

    tw = tc_writeRequest()
    tw.var_names = ["GVL.fMiniNozzleSP"]
    tw.types = ["lreal"]
    tw.values = [req.value]
    print colored("Setting nozzle target temperature to " + str(tw.values), 'yellow')
    tw_res = tc.twincat_write(tw)

    if not req.wait:
        return res

    tr = tc_readRequest()
    tr.var_names = ["GVL.FieldTC1"]
    tr.types = ["int"]
    reading = tc.twincat_read(tr)
    while abs((float(reading.values[0]) / 10.0) - req.value) > 5.0:
        time.sleep(1)
        reading = tc.twincat_read(tr)
        print colored("Waiting for temperature: " + str((float(reading.values[0]) / 10.0)), 'yellow')

    
    return res

def reset_motor(req):
    robot_config = settings.ROBOT_CONFIG()

    tw = tc_writeRequest()
    tw.var_names = ["GVL.Override", "GVL.ENABLE", "GVL.Reset", "GVL.RunPositive", "GVL.RunNegative", "GVL.Stop"]
    tw.types = ["real", "bool", "bool", "bool", "bool", "bool"]
    tw.values = [float(robot_config['default_override']), False, False, False, False, False]
    tw_res = tc.twincat_write(tw)

    time.sleep(0.2)
    tw.var_names = ["GVL.Reset"]
    tw.types = ["bool"]
    tw.values = ["true"]
    tw_res = tc.twincat_write(tw)

    time.sleep(0.2)
    tw.var_names = ["GVL.Reset"]
    tw.types = ["bool"]
    tw.values = ["false"]
    tw_res = tc.twincat_write(tw)

    res = ex_reset_motorResponse()
    res.message = "SUCCESS"
    return res

def start_motor(req):
    robot_config = settings.ROBOT_CONFIG()

    #set ENABLE to true
    tw = tc_writeRequest()
    tw.var_names = ["GVL.ENABLE"]
    tw.values = ["true"]
    tw.types = ["bool"]

    tw_res = tc.twincat_write(tw)

    time.sleep(0.2)

    #set speed
    tw = tc_writeRequest()
    tw.var_names = ["GVL.Override"]
    tw.types = ["real"]
    tw.values = ["0.0"]    

    tw_res = tc.twincat_write(tw)

    time.sleep(0.2)

    #set RunNegative to true
    tw.var_names = ["GVL.RunNegative"]
    tw.types = ["bool"]
    tw.values = ["true"]    

    tw_res = tc.twincat_write(tw)

    time.sleep(0.2)

    res = ex_start_motorResponse()
    res.message = "SUCCESS"
    return res

def change_motor_speed(req):
    #set speed
    tw = tc_writeRequest()
    tw.var_names = ["GVL.Override"]
    tw.types = ["real"]
    tw.values = [req.value]

    tw_res = tc.twincat_write(tw)

    time.sleep(0.2)
    res = ex_change_motor_speedResponse()
    res.message = "SUCCESS"

    return res


def main():

    try:
        print colored("[deepbuilder] Extruder Control STARTUP", 'yellow')
        rospy.init_node("deepbuilder_extruder_control")

        srv_cms = rospy.Service('deepbuilder/extruder/change_motor_speed',ex_change_motor_speed, change_motor_speed)
        srv_ew = rospy.Service('deepbuilder/extruder/reset_motor',ex_reset_motor, reset_motor)
        srv_sm = rospy.Service('deepbuilder/extruder/start_motor', ex_start_motor, start_motor)
        srv_ct = rospy.Service('deepbuilder/extruder/change_temp', ex_change_temp, change_temp)
        rospy.spin()
    except KeyboardInterrupt:
        rospy.signal_shutdown("KeyboardInterrupt")
        raise

    except:
        raise

if __name__ == "__main__":
    main()