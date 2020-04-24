package main

import (
	"context"
	"log"
	"net/http"

	"github.com/grpc-ecosystem/grpc-gateway/runtime"
	"google.golang.org/grpc"

	gw "home-recipes/middleware/recipes/generated"
)

func serveSwagger(w http.ResponseWriter, r *http.Request) {
	http.ServeFile(w, r, "middleware/recipes-service.swagger.json")
}

func run() error {
	ctx := context.Background()
	ctx, cancel := context.WithCancel(ctx)
	defer cancel()

	// Register gRPC server endpoint
	rmux := runtime.NewServeMux()
	opts := []grpc.DialOption{grpc.WithInsecure()}
	err := gw.RegisterRecipesServiceHandlerFromEndpoint(ctx, rmux, "localhost:50000", opts)
	if err != nil {
		return err
	}

	// Serve the swagger JSON file
	mux := http.NewServeMux()
	mux.Handle("/", rmux)
	mux.HandleFunc("/swagger.json", serveSwagger)

	// Server the swagger UI and point it to the swagger JSON file
	fs := http.FileServer(http.Dir("middleware/swagger-ui"))
	mux.Handle("/swaggerui/", http.StripPrefix("/swaggerui", fs))

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
