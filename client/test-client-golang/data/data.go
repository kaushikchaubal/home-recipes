package data

import "home-recipes/client/test-client-golang/recipes/generated"

// Ingredients - Mock data of all the recipes to return for ListAllRecipes endpoint
var Ingredients = []generated.Ingredient{
	{
		Name:     "Flour",
		Quantity: "10 kgs",
	},
	{
		Name:     "Eggs",
		Quantity: "10 pieces",
	},
	{
		Name:     "Chicken",
		Quantity: "1 kg",
	},
}

// Recipes - Mock data for all the recipes to send for GetIngredientsForAllRecipes endpoint
var Recipes = []generated.Recipe{
	{
		Name:    "Bread",
		Cuisine: "International",
	},
	{
		Name:    "Nachos",
		Cuisine: "Mexican",
	},
}
