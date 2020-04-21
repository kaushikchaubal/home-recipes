package data

import "home-recipes/server/test-client-golang/recipes/generated"

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
