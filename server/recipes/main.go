package main

import (
	"home-recipes/server/recipes/generated"
	"home-recipes/server/recipes/handlers"
	"log"
	"net"
	"net/http"
	"sync"

	"github.com/prometheus/client_golang/prometheus/promhttp"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
)

const grpcPort = ":50000"
const metricsPort = ":2112"

func main() {
	bootstraps := []interface{}{
		startGRPCServer,
		startMetricsServer,
	}

	var wg sync.WaitGroup
	wg.Add(len(bootstraps))

	for _, bootstrap := range bootstraps {
		go bootstrap.(func(*sync.WaitGroup))(&wg)
	}

	wg.Wait()
}

func startGRPCServer(wg *sync.WaitGroup) {
	defer wg.Done()
	log.Printf("Starting gRPC server on port %v", grpcPort)

	listener, err := net.Listen("tcp", grpcPort)

	if err != nil {
		log.Fatal(err)
	}

	server := grpc.NewServer()

	generated.RegisterRecipesServiceServer(server, &handlers.GRPCHanlders{})

	reflection.Register(server)

	err = server.Serve(listener)

	if err != nil {
		log.Fatal(err)
	}
}

func startMetricsServer(wg *sync.WaitGroup) {
	defer wg.Done()
	log.Printf("Started metrics server on port %v", metricsPort)

	http.Handle("/metrics", promhttp.Handler())
	http.Handle("/hello", &handlers.HttpHandler{})

	err := http.ListenAndServe(metricsPort, nil)

	if err != nil {
		log.Fatal(err)
	}
}
