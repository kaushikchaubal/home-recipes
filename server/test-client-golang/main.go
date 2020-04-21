package main

import (
	"context"
	"google.golang.org/grpc"
	"home-recipes/server/test-client-golang/recipes/generated"
	"log"
	"time"
)

const (
	address = "localhost:50000"
	name    = "Bread"
)

func main() {
	// Set up a connection to the server.
	conn, err := grpc.Dial(address, grpc.WithInsecure(), grpc.WithBlock())
	if err != nil {
		log.Fatalf("did not connect: %v", err)
	}
	defer conn.Close()
	c := generated.NewRecipesServiceClient(conn)

	ctx, cancel := context.WithTimeout(context.Background(), time.Second)
	defer cancel()
	response, err := c.AddRecipe(ctx, &generated.AddRecipeRequest{RecipeName: name})
	if err != nil {
		log.Fatalf("could not greet: %v", err)
	}
	log.Printf("Response received. %s", response)
}
