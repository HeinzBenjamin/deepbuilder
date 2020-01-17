import roslibpy, time, signal
from contextlib import contextmanager


HOST = 'localhost'
PORT = 9090
SRV_TIMEOUT = 10

@contextmanager
def timeout(time):
    signal.signal(signal.SIGALRM, raise_timeout)
    signal.alarm(time)
    try:
        yield
    except TimeoutError:
        pass
    finally:
        signal.signal(signal.SIGALRM, signal.SIG_IGN)

def raise_timeout(signum, frame):
    raise TimeoutError



class Connection():
    def __init__(self):
        self.client = roslibpy.Ros(host=HOST, port=PORT)
        self.client.run()
        self.my_srv_proxy = roslibpy.Service(self.client, '/rosout/get_loggers', 'roscpp/GetLoggers')


    #this is the method to call
    def call_service(self, value_dict):              
        value_dict['additional_argument'] = 'hello ros'

        result = self._safe_request('my_srv_proxy', value_dict)

        return result.data
    

    def _safe_request(self, proxy_name, value_dict):
        result = None
        
        while True:
            request = roslibpy.ServiceRequest(value_dict)
            proxy = self.__getattribute__(proxy_name)
            try:
                with timeout(SRV_TIMEOUT):
                    result = proxy.call(request)

            except Exception as e:
                print("{}\nNon timeout error in ROS service request. Retrying... ".format(e))
                time.sleep(0.5)
                continue

            if result == None:
                print("ROS service timeout")
                self._reset_client()
            else:
                break

        return result


    def _reset_client(self):
        self.client.close()
        time.sleep(0.2)
        self.client.connect()
        time.sleep(0.2)
        self.my_srv_proxy = roslibpy.Service(self.client, '/rosout/get_loggers', 'roscpp/GetLoggers')

    def __del__(self):
        self.client.terminate()


if __name__ == "__main__":

    my_connection = Connection()
    values = dict(argumentA = 'hello', argumentB = 'world')
    srv_result = my_connection.call_service(values)

    print(srv_result)