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
import argparse, torch, torchvision, train, sys, json
from http.server import HTTPServer, BaseHTTPRequestHandler
from urllib.parse import urlparse
from torch import nn

class S(BaseHTTPRequestHandler):
    def init(self):
        self.model = "init"

    def load_model(self, path):
        self.model = "model" + path

    def unpack(self, data):
        data = data.split(',')
        f = []
        for d in data:
            f.append(float(d))    

        return torch.tensor(data=f,dtype=torch.float16)

    def encode(self, torch_tensor):
        global model
        res = {}
        try:
            res['response'] = list(model.encode(torch_tensor).data)
        except:
            res['response'] = str(sys.exc_info()[0])
        return json.dumps(res)

    def decode(self, torch_tensor):
        global model
        res = {}
        try:
            res['response'] = list(model.decode(torch_tensor).data)
        except:
            res['response'] = str(sys.exc_info()[0])
        return json.dumps(res)

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
        query = urlparse(self.path).query
        query_components = dict(qc.split("=") for qc in query.split("&"))
        req = query_components["request"]
        data = query_components["data"]

        if req == 'encode':
            res = self.encode(data)
            self.wfile.write(res.encode(encoding='utf_8'))

        elif req == 'decode':
            res = self.decode(data)
            self.wfile.write(res.encode(encoding='utf_8'))

        elif req == 'run':
            res = self.run(data)
            self.wfile.write(res.encode(encoding='utf_8'))

        return

    def do_HEAD(self):
        self._set_headers()

    def do_POST(self):
        # Doesn't do anything with posted data
        self._set_headers()
        self.wfile.write(self._html("POST!"))


def run(server_class=HTTPServer, handler_class=S, addr="localhost", port):
    server_address = (addr, port)
    httpd = server_class(server_address, handler_class)

    print(f"Starting httpd server on {addr}:{port}")
    httpd.serve_forever()

global model
if __name__ == "__main__":
    global model
    parser = argparse.ArgumentParser(description="Run a simple HTTP server")
    parser.add_argument("-l", "--listen", default="localhost", help="Specify the IP address on which the server listens")
    parser.add_argument("-p", "--port", type=int, default=9898, help="Specify the port on which the server listens")
    parser.add_argument("-m", "--model", default='D:/OneDrive - felbrich.com/Work/01 Academic/04 Robotic Reinforcement Learning/08 3D Shape Representation/meshdata/autoencoder_training/trained_models/model.db', help="Specify the path to the torch model to be loaded")
    args = parser.parse_args()

    tm = torch.load(args.model)
    model = train.autoencoder()
    model.load(tm)
    run(addr=args.listen, port=args.port)