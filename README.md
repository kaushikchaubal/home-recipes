# Home Recipes

A simple full-stack app that uses a power-packed tech stack. Technologies used so far include:
* gRPC
* Golang
* Protobufs 

### Steps followed to create server:

1. Ensure golang is installed, GOPATH is set

2. Install grpc
    ```
    go get google.golang.org/grpc
    ```

3. Install protoc and confirm version
    * Available here: https://github.com/protocolbuffers/protobuf/releases
    * Once downloaded and added in PATH, check
        ```
        protoc --version
        ```

4. Install protoc-gen-go & add to PATH
    ```
    go get github.com/golang/protobuf/protoc-gen-go
    PATH="$PATH:$(go env GOPATH)/bin"
    ```

5. (optional) Install protobuf support for VS code
    * Available here: https://marketplace.visualstudio.com/items?itemName=zxh404.vscode-proto3

6. Create your proto file

7. Run the protoc command to create the generated code
    ```
    protoc ./defs/recipes-service.proto --go_out=plugins=grpc:./server
    ```

7. Implement your server

8. Run your server
    ```
    go build -o out/recipes-server server/recipes/main.go && ./out/recipes-server
    ```