console.log("Hello")

const {PathRequest} = require('tims-grpc/src/essaid/grpc/tims/v0/tims_pb')
const {TimsClient} = require('tims-grpc/src/essaid/grpc/tims/v0/tims_grpc_web_pb')

var request = new PathRequest()
var client = new TimsClient('http://localhost:8080', null, null)
var call = client.n3CPaths(request)
call.on('data', function (path){
    console.log('data received')
    console.log(JSON.stringify(path, null, 2))
    console.log(path.getConceptsList()[0].getCode())
    console.log(path.getConceptsList()[0].getLabel())
})

call.on('end', function (){
    console.log('call ended')
})

call.on('error', function (e){
    console.log('Error')
    console.log(e)
})

call.on('status', function (status){
    console.log('Status:')
    console.log(JSON.stringify(status, null, 2))
})

console.log("finish script")



