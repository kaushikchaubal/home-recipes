1. Created generated code
    ```
    protoc ./defs/recipes-service.proto --go_out=plugins=grpc:./client/test-client-golang
    ```

2. Implement test client

3. Run test client 
    ```
    go build -o out/test-client-golang client/test-client-golang/main.go && ./out/test-client-golang
    ```