#!/usr/bin/env python
import rospy, requests, json, settings
from deepbuilder.srv import *
from termcolor import colored

def twincat_request(request_json):
    headers = {
        'Content-type': 'application/json'}

    while True:
        try:
            response = requests.post(url = settings.TWINCAT_ADDRESS, headers = headers, json = request_json)
            return response.json()
        except Exception as e:
            print colored("TwinCAT communication error!\n" + e.message)
            _in = raw_input("Fix the connection. To retry press enter. To ignore type [i] and press enter")
            if _in == 'i':
                return {}
    


def twincat_write(req):
    req_json = {
        "request_type": "write",
        "names": req.var_names,
        "types": req.types,
        "values": req.values
    }
    res = tc_writeResponse()
    json_res = twincat_request(req_json)

    if json_res["message"]:
        raise Exception(json_res['message'])

    res.message = "SUCCESS"
    return res


def twincat_read(req):
    req_json = {
        "request_type": "read",
        "names": req.var_names,
        "types": req.types 
    }
    res = tc_readResponse()
    
    json_res = twincat_request(req_json)

    if json_res["message"]:
        raise Exception(json_res['message'])

    res.message = "SUCCESS"
    res.values = json_res["values"]

    return res

def main():

    try:
        print colored("[deepbuilder] TwinCAT Control STARTUP", 'blue')
        rospy.init_node("deepbuilder_twincat_control")

        srv_read = rospy.Service('deepbuilder/twincat/read', tc_read, twincat_read)
        srv_write = rospy.Service('deepbuilder/twincat/write', tc_write, twincat_write)

        rospy.spin()
    except KeyboardInterrupt:
        rospy.signal_shutdown("KeyboardInterrupt")
        raise

    except:
        raise

if __name__ == "__main__":
    main()