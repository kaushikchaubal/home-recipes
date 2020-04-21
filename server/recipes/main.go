package main

import (
	"golang.org/x/net/context"
	"google.golang.org/grpc"
	"home-recipes/server/recipes/generated"
	"log"
	"net"
)

const port = ":50000"

type server struct{}

func (s *server) AddRecipe(ctx context.Context, req *generated.AddRecipeRequest) (*generated.AddRecipeResponse, error) {
	return &generated.AddRecipeResponse{Success: true}, nil
}

func main() {
	listener, err := net.Listen("tcp", port)

	if err != nil {
		log.Fatal(err)
	}

	s := grpc.NewServer()
	log.Printf("Started server on %v", port)

	generated.RegisterRecipesServiceServer(s, &server{})

	s.Serve(listener)

}
