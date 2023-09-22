from essaid.grpc.tims.v0 import tims_pb2_grpc, tims_pb2
import grpc

channel = grpc.insecure_channel('localhost:9090')
stub = tims_pb2_grpc.TimsStub(channel)

request = tims_pb2.PathRequest()

for path in stub.N3CPaths(request):
    print(path)
