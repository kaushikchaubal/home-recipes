package main

import (
	"context"
	"home-recipes/server/test-client-golang/recipes/generated"
	"io"
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
	newRecipe := &generated.Recipe{Name: "Sushi", Cuisine: "Japanese"}

	response, err := c.AddRecipe(ctx, &generated.AddRecipeRequest{Recipe: newRecipe})
	if err != nil {
		log.Fatalf("Error: %v", err)
	}
	log.Printf("Response received for AddRecipe %s", response)

	// Testing ListAllRecipes method
	stream, err := c.ListAllRecipes(ctx, &generated.ListAllRecipesRequest{})
	if err != nil {
		log.Fatalf("Error: %v", err)
	}

	for {
		response, err := stream.Recv()
		if err == io.EOF {
			break
		}
		if err != nil {
			log.Fatal(err)
		}

		log.Printf("Response received for ListAllRecipes: %s", response)
	}

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
