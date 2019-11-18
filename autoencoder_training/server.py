"""
Very simple HTTP server in python (Updated for Python 3.7)

Usage:

    ./dummy-web-server.py -h
    ./dummy-web-server.py -l localhost -p 8000

Send a GET request:

    curl http://localhost:8000

Send a HEAD request:

    curl -I http://localhost:8000

Send a POST request:

    curl -d "foo=bar&bin=baz" http://localhost:8000

"""
import argparse, torch, torchvision, train_conv, train_hilbert, sys, json
from http.server import HTTPServer, BaseHTTPRequestHandler
from urllib.parse import urlparse
from torch import nn

class S(BaseHTTPRequestHandler):
    def run(self, torch_tensor):
        global model
        res = {}
        try:
            res['response'] = list(model.forward(torch_tensor).data)
        except:
            res['response'] = str(sys.exc_info()[0])
        return json.dumps(res)

    def _set_headers(self):
        self.send_response(200)
        self.send_header('Content-Type', 'application/json')
        self.end_headers()

    def _html(self, message):
        """This just generates an HTML document that includes `message`
        in the body. Override, or re-write this do do more interesting stuff.

        """
        content = f"<html><body><h1>{message}</h1></body></html>"
        return content.encode("utf8")  # NOTE: must return a bytes object!

    def do_GET(self):
        self._set_headers()
        return

    def do_HEAD(self):
        self._set_headers()

    def do_POST(self):
        global model
        global criterion
        print("Received ", end='')
        # Doesn't do anything with posted data
        self._set_headers()
        content_len = int(self.headers.get('Content-Length'))
        bla = self.rfile.read(content_len)
        request = json.loads(bla)

        t = torch.tensor(data=request['data']).cuda()

        res = {}
        if request['request'] == 'encode':
            print("encode request.")
            t /= 750.0
            res_t = model.encode(t)
            res['request']=str(res_t.shape[0])
            res['data'] = res_t.tolist()

        elif request['request'] == 'decode':
            print("decode request.")
            res_t = model.decode(t) * 750.0
            res['request']=str(res_t.shape[0])
            res['data'] = res_t.tolist()

        elif request['request'] == 'run':
            print("run request.")
            t /= 750.0
            res_e = model.encode(t)
            res['request']=str(res_e.squeeze().shape[0])
            res['data'] = res_e.squeeze().tolist()
            
            res_t = model.decode(res_e)
            res_t *= 750.0
            res_t=res_t.view(32*32*32)
            res['request']+=","+str(res_t.shape[0])
            res['data'].extend(res_t.tolist())

            loss = criterion(t*750.0, res_t)
            res['request']+=",1"
            res['data'].append(loss.tolist())
        
        
        r = json.dumps(res)
        data = r.encode(encoding='utf_8')
        print("Succesfully calculated.")
        self.wfile.write(data)



def run(port, server_class=HTTPServer, handler_class=S, addr="localhost"):
    server_address = (addr, port)
    httpd = server_class(server_address, handler_class)
    
    print(f"Starting httpd server on {addr}:{port}")
    httpd.serve_forever()

global model
global criterion
if __name__ == "__main__":
    global model
    global criterion
    parser = argparse.ArgumentParser(description="Run a simple HTTP server")
    parser.add_argument("-l", "--listen", default="localhost", help="Specify the IP address on which the server listens")
    parser.add_argument("-p", "--port", type=int, default=9898, help="Specify the port on which the server listens")
    parser.add_argument("-m", "--model", default='D:/OneDrive - felbrich.com/Work/01 Academic/04 Robotic Reinforcement Learning/08 3D Shape Representation/meshdata/autoencoder_training/trained_models/model2.db', help="Specify the path to the torch model to be loaded")
    args = parser.parse_args()

    print("Loading loss criterion...")
    criterion = nn.MSELoss()

    print("Loading torch model "+args.model+"...")
    tm = torch.load(args.model)

    print("Building new torch model...")
    model = train_conv.autoencoder(576)

    print("Applying loaded model...")
    model.load(tm)

    print("Ready")
    run(addr=args.listen, port=args.port)