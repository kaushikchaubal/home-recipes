# Home Recipes
A simple app that helps to share, learn, innovative with recipes at home! 

## Demo
Here is a GIF of how the app looks like:

![home-recipes.gif](home-recipes.gif)

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

## Digital whiteboarding
* As part of the implementation stage, Miro was used as the digital whiteboard of choice
* The miro board associated with home-recipes can be found here: https://miro.com/app/board/o9J_ktw-EKc=/ 
* You will find details of multiple things including architecture design, the API definitions and UI mocks details

## Developer info
* All different components are documented in their respective README files
* The list of available README files are here:
    * Server: server/README.md
    * Client: client/home_recipes_app/README.md
    * Node.js test client: client/test-client-node/README.md
    * Golang test client: client/test-client-golang/README.md
    * Deployment: deploy/README.md

