# Home Recipes
A simple app that helps to share, learn, innovative with recipes at home! 

## Demo
Here is a GIF of how the app looks like:

![home-recipes.gif](assets/home-recipes.gif)

## Tech stack
One of the key motivations to build this app was to experiment with different technologies. The technologies used to build this app are explained in the following sections:

### Service definitions
* Written using protobuf (proto3 syntax)
* Exposes the following types of gRPC endpoints:
    * unary messages
    * server-streaming messages
    * client-streaming messages
    * bidirectional streaming messages

### Application Server
* Written in Golang (v.1.14)
* Implements GRPC server  

### Client
* Written in Dart (v2.7.2)
* Using the Flutter framework
* Compiled for multiple platforms

### Platform support
* Android
* iOS
* Web-app _(partial support)_
* MacOS _(partial support)_

### Middleware
* HTTP-GRPC proxy implemented using gRPC-Gateway
* Published Swagger UI on top of HTTP-GRPC proxy

### Telemetry
* [Prometheus](https://github.com/prometheus/prometheus) to collect metrics
* [Grafana](https://grafana.com/) to visualize metrics

### Server deployment
* Created as a docker image
* Tagged docker image hosted on dockerhub
* Running in an elastic Kubernetes cluster
* Hosted on Azure Kubernetes Service

### Test clients
* gRPC client written in Node.js
* gRPC client written in Golang

### Client deployment
* Android apk available on thhe releases page: https://github.com/kaushikchaubal/home-recipes/releases/tag/0.0.1

## Architecture
The final architecture of the designed system is as seen here:

![architecture-diagram.png](assets/architecture-diagram.png)

## Digital whiteboarding
* As part of the implementation stage, Miro was used as the digital whiteboard of choice
* The miro board associated with home-recipes can be found here: https://miro.com/app/board/o9J_ktw-EKc=/ 
* You will find details of multiple things including architecture design, the API definitions and UI mocks details

## Developer info
* All different components are documented in their respective README files
* The list of available README files are here:
    * Server: https://github.com/kaushikchaubal/home-recipes/blob/master/server/README.md
    * Client: https://github.com/kaushikchaubal/home-recipes/blob/master/client/home_recipes_app/README.md
    * Middleware: https://github.com/kaushikchaubal/home-recipes/blob/master/middleware/README.md
    * Node.js test client: https://github.com/kaushikchaubal/home-recipes/blob/master/client/test-client-node/README.md
    * Golang test client: https://github.com/kaushikchaubal/home-recipes/blob/master/client/test-client-golang/README.md
    * Deployment: https://github.com/kaushikchaubal/home-recipes/blob/master/deploy/README.md

