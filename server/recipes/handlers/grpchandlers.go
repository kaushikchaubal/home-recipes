package handlers

import (
	"home-recipes/server/recipes/data"
	"home-recipes/server/recipes/generated"
	"home-recipes/server/recipes/metrics"
	"io"
	"log"
	"strconv"
	"time"

	"golang.org/x/net/context"
)

type GRPCHanlders struct{}

func (s *GRPCHanlders) AddRecipe(ctx context.Context, req *generated.AddRecipeRequest) (*generated.AddRecipeResponse, error) {
	log.Printf("Adding new recipe\t\tName: %v, Cuisine: %v", req.GetRecipe().GetName(), req.GetRecipe().GetCuisine())

	start := time.Now()
	status := 200

	response := &generated.AddRecipeResponse{Success: true}

	metrics.GRPCRequestMetric.WithLabelValues(strconv.Itoa(status), "add_recipe").Observe(time.Since(start).Seconds())

	return response, nil
}

func (s *GRPCHanlders) ListAllRecipes(req *generated.ListAllRecipesRequest, stream generated.RecipesService_ListAllRecipesServer) error {
	log.Printf("Listing all available recipes")

	start := time.Now()
	status := 200

	for _, recipe := range data.Recipes {
		err := stream.Send(&generated.ListAllRecipesResponse{Recipe: &recipe})

		if err != nil {
			status = 400
		}
	}

	metrics.GRPCRequestMetric.WithLabelValues(strconv.Itoa(status), "list_all_recipes").Observe(time.Since(start).Seconds())

	return nil
}

func (s *GRPCHanlders) ListAllIngredientsAtHome(stream generated.RecipesService_ListAllIngredientsAtHomeServer) error {
	log.Printf("Noting all the ingredients that you have at home:")

	for {
		data, err := stream.Recv()
		if err == io.EOF {
			return stream.SendAndClose(&generated.ListAllIngredientsAtHomeResponse{Success: true})
		}
		if err != nil {
			return err
		}

		log.Printf("You have %v quantity of %v", data.GetIngredient().GetQuantity(), data.GetIngredient().GetName())
	}
}

func (s *GRPCHanlders) GetIngredientsForAllRecipes(stream generated.RecipesService_GetIngredientsForAllRecipesServer) error {
	log.Printf("For all recipes sent, I will reply back with a list of ingredients")

	for {
		recipe, err := stream.Recv()
		if err == io.EOF {
			break
		}
		if err != nil {
			return err
		}

		log.Printf("You have requested ingredients for %v", recipe.GetRecipe().GetName())

		RecipeToIngredients := data.RecipeToIngredientsMap()
		ingredients := RecipeToIngredients[recipe.GetRecipe().GetName()]
		for _, item := range ingredients {
			stream.Send(&generated.GetIngredientsForAllRecipesResponse{Ingredient: &item})
		}
	}

	return nil
}
