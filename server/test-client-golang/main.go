package main

import (
	"context"
	"home-recipes/server/test-client-golang/recipes/generated"
	"log"
	"time"

	"google.golang.org/grpc"
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
		log.Fatalf("Error: %v", err)
	}
	log.Printf("Response received for AddRecipe %s", response)

	secondResponse, err := c.ListAllRecipes(ctx, &generated.ListAllRecipesRequest{})
	if err != nil {
		log.Fatalf("Error: %v", err)
	}
	log.Printf("Response received for ListAllRecipes: %s", secondResponse)
}
