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

	// Testing AddRecipe method
	response, err := c.AddRecipe(ctx, &generated.AddRecipeRequest{RecipeName: "Bread"})
	if err != nil {
		log.Fatalf("Error: %v", err)
	}
	log.Printf("Response received for AddRecipe %s", response)

	// Testing ListAllRecipes method
	secondResponse, err := c.ListAllRecipes(ctx, &generated.ListAllRecipesRequest{})
	if err != nil {
		log.Fatalf("Error: %v", err)
	}
	log.Printf("Response received for ListAllRecipes: %s", secondResponse)

	// Testing UploadPhoto method
	thirdResponse, err := c.UploadPhoto(ctx, &generated.UploadPhotoRequest{PhotoName: "Kavee.jpg", PhotoType: "jpg"})
	if err != nil {
		log.Fatalf("Error: %v", err)
	}
	log.Printf("Response received for UploadPhoto: %s", thirdResponse)

	// Testing GetIngredientsForAllRecipes method
	fourthResponse, err := c.GetIngredientsForAllRecipes(ctx, &generated.GetIngredientsRequest{RecipeName: "Bread"})
	if err != nil {
		log.Fatalf("Error: %v", err)
	}
	log.Printf("Response received for GetIngredientsForAllRecipes: %s", fourthResponse)
}
