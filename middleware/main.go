package main

import (
	"context"
	"log"
	"net/http"

	"github.com/grpc-ecosystem/grpc-gateway/runtime"
	"google.golang.org/grpc"

	gw "home-recipes/middleware/recipes/generated"
)

func run() error {
	ctx := context.Background()
	ctx, cancel := context.WithCancel(ctx)
	defer cancel()

	// Register gRPC server endpoint
	// Note: Make sure the gRPC server is running properly and accessible
	mux := runtime.NewServeMux()
	opts := []grpc.DialOption{grpc.WithInsecure()}
	err := gw.RegisterRecipesServiceHandlerFromEndpoint(ctx, mux, "localhost:50000", opts)
	if err != nil {
		return err
	}

	// Start HTTP server (and proxy calls to gRPC server endpoint)
	log.Printf("Server starting on port :8080")
	return http.ListenAndServe(":8080", mux)
}

func main() {
	err := run()
	if err != nil {
		log.Fatal(err)
	}
}
