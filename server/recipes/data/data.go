package data

import "home-recipes/server/recipes/generated"

// Recipes - Mock data of all the recipes to return for ListAllRecipes endpoint
var Recipes = []generated.Recipe{
	{
		Name:    "Pasta",
		Cuisine: "Italian",
	},
	{
		Name:    "Lamb Machurian",
		Cuisine: "Chinese",
	},
	{
		Name:    "Fish and chips",
		Cuisine: "British",
	},
}

// RecipeToIngredientsMap - mock data for mapping recipes to ingredients for GetIngredientsForAllRecipes endpoint
func RecipeToIngredientsMap() map[string][]generated.Ingredient {
	recipeToIngredientsMap := make(map[string][]generated.Ingredient)
	recipeToIngredientsMap["Bread"] = []generated.Ingredient{
		{Name: "Flour", Quantity: "10kg"},
		{Name: "Yeast", Quantity: "1 packet"},
	}
	recipeToIngredientsMap["Nachos"] = []generated.Ingredient{
		{Name: "Tortilla chips", Quantity: "1 packett"},
		{Name: "Sour cream", Quantity: "1 packet"},
		{Name: "Cheese", Quantity: "200 gms"},
	}

	return recipeToIngredientsMap
}
