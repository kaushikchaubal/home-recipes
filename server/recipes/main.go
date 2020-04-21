package main

import (
	"home-recipes/server/recipes/data"
	"home-recipes/server/recipes/generated"
	"log"
	"net"

	"golang.org/x/net/context"
	"google.golang.org/grpc"
)

const port = ":50000"

type server struct{}

func (s *server) AddRecipe(ctx context.Context, req *generated.AddRecipeRequest) (*generated.AddRecipeResponse, error) {
	log.Printf("Adding new recipe\t\tName: %v, Cuisine: %v", req.GetRecipe().GetName(), req.GetRecipe().GetCuisine())
	return &generated.AddRecipeResponse{Success: true}, nil
}

func (s *server) ListAllRecipes(req *generated.ListAllRecipesRequest, stream generated.RecipesService_ListAllRecipesServer) error {
	log.Printf("Listing all available recipes")

	for _, recipe := range data.Recipes {
		stream.Send(&generated.ListAllRecipesResponse{Recipe: &recipe})
	}

	return nil
}

func (s *server) UploadPhoto(ctx context.Context, req *generated.UploadPhotoRequest) (*generated.UploadPhotoResponse, error) {
	log.Printf("Received request for UploadPhoto with data: photo_name = %v, photo_type = %v", req.GetPhotoName(), req.GetPhotoType())

	// do something smart with this picture that you just received!

	return &generated.UploadPhotoResponse{Yayy: "Booyaaa!"}, nil
}

func (s *server) GetIngredientsForAllRecipes(ctx context.Context, req *generated.GetIngredientsRequest) (*generated.GetIngredientsResponse, error) {
	log.Printf("Received request for GetIngredientsForAllRecipes: recipe_name = %v", req.GetRecipeName())
	return &generated.GetIngredientsResponse{IngredientName: "Flour"}, nil
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
