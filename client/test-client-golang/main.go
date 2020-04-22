package main

import (
	"context"
	"home-recipes/client/test-client-golang/data"
	"home-recipes/client/test-client-golang/recipes/generated"
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
	{
		newRecipe := &generated.Recipe{Name: "Sushi", Cuisine: "Japanese"}

		response, err := c.AddRecipe(ctx, &generated.AddRecipeRequest{Recipe: newRecipe})
		if err != nil {
			log.Fatalf("Error: %v", err)
		}
		log.Printf("Response received for AddRecipe %s", response)
	}

	// Testing ListAllRecipes method
	{
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
	}

	// Testing ListAllIngredientsAtHome method
	{
		stream, err := c.ListAllIngredientsAtHome(ctx)
		if err != nil {
			log.Fatalf("Error: %v", err)
		}

		for _, ingredient := range data.Ingredients {
			stream.Send(&generated.ListAllIngredientsAtHomeRequest{Ingredient: &ingredient})
		}

		response, err := stream.CloseAndRecv()
		if err != nil {
			log.Fatalf("Error: %v", err)
		}

		log.Printf("Response received for ListAllIngredientsAtHome: %s", response)
	}

	// Testing GetIngredientsForAllRecipes method
	{
		stream, err := c.GetIngredientsForAllRecipes(ctx)
		if err != nil {
			log.Fatalf("Error: %v", err)
		}

		// Receive stream from server for list of ingredients
		doneCh := make(chan struct{})
		go func() {
			for {
				ingredients, err := stream.Recv()
				if err == io.EOF {
					doneCh <- struct{}{}
					break
				}
				if err != nil {
					log.Fatalf("Error: %v", err)
				}

				log.Printf("Ingredients needed: %s", ingredients)
			}
		}()

		// Send stream to server of the list of recipes
		for _, item := range data.Recipes {
			err := stream.Send(&generated.GetIngredientsForAllRecipesRequest{Recipe: &item})
			if err != nil {
				log.Fatalf("Error: %v", err)
			}
		}

		stream.CloseSend()
		<-doneCh
	}

}
