### Steps to make proto file work with grpc gateway

1. Install the following three dependencies locally
    ```
    go get github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
    go get github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger
    go get github.com/golang/protobuf/protoc-gen-go
    ```

2. Copy all third-party libs under def folder (google as well as protoc-gen-swagger)

3. Add annotations to the proto file

4. Generate proto files for grpc-gateway
    ```
    protoc -I./defs defs/recipes-service.proto --go_out=plugins=grpc:./middleware
    protoc -I./defs defs/recipes-service.proto --grpc-gateway_out=logtostderr=true:./middleware
    ```

5. Implement middleware 

6. Run middleware (also ensure the server is running as expected)
    ```
    go build -o out/grpc-gateway middleware/main.go && ./out/grpc-gateway
    ```
