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
