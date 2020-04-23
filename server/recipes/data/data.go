package data

import "home-recipes/server/recipes/generated"

// Recipes - Mock data of all the recipes to return for ListAllRecipes endpoint
var Recipes = []generated.Recipe{
	{
		Name: "Pizza", 
		Cuisine: "Italian", 
	},
	{
		Name: "Beef Burgers", 
		Cuisine: "American", 
	},
	{
		Name: "Croissants", 
		Cuisine: "French", 
	},
	{
		Name: "Katsu Curry", 
		Cuisine: "Japanese", 
	},
	{
		Name: "Butter Chicken", 
		Cuisine: "Indian", 
	},
	{
		Name: "Raviolli", 
		Cuisine: "Italian", 
	},
	{
		Name: "Sunday Roast", 
		Cuisine: "British", 
	},
	{
		Name: "Kebabs", 
		Cuisine: "Lebanese", 
	},
	{
		Name: "Bread", 
		Cuisine: "International", 
	},
	{
		Name: "Duck stir fry", 
		Cuisine: "Chinese", 
	},
	{
		Name: "Ceviche", 
		Cuisine: "Peruvian", 
	},
	{
		Name: "Burritos", 
		Cuisine: "Mexican", 
	},
	{
		Name: "Pho", 
		Cuisine: "Vietnamese", 
	},
	{
		Name: "Dim Sums", 
		Cuisine: "Hong Kong", 
	},
	{
		Name: "Tagines", 
		Cuisine: "Moroccon", 
	},
	{
		Name: "Fish and chips", 
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
