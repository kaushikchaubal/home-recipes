import 'package:flutter/material.dart';

class ShowAllRecipesRoute extends StatefulWidget {
  @override
  _ShowAllRecipesState createState() => _ShowAllRecipesState();
}

class _ShowAllRecipesState extends State<ShowAllRecipesRoute> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('All available recipes'),
          backgroundColor: Colors.teal,
        ),
        body: ListView(children: <Widget>[
          DataTable(
            columns: [
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Cuisine')),
              DataColumn(label: Text('Likes')),
            ],
            rows: recipes
                .map((recipe) => DataRow(cells: [
              DataCell(
                Text(recipe.recipeName),
              ),
              DataCell(
                  Text(recipe.recipeCuisine)
              ),
              DataCell(
                  Text(recipe.likes.toString())
              )
            ])).toList(),
          ),
        ]));
  }
}

class Recipe {
  String recipeName;
  String recipeCuisine;
  int likes;

  Recipe({this.recipeName, this.recipeCuisine, this.likes});
}

// Currently hardcoded list of recipes on the client. This will be streamed by the server
var recipes = <Recipe>[
  Recipe(recipeName: "Pizza", recipeCuisine: "Italian", likes: 3),
  Recipe(recipeName: "Beef Burgers", recipeCuisine: "American", likes: 3),
  Recipe(recipeName: "Croissants", recipeCuisine: "French", likes: 3),
  Recipe(recipeName: "Katsu Curry", recipeCuisine: "Japanese", likes: 3),
  Recipe(recipeName: "Butter Chicken", recipeCuisine: "Indian", likes: 3),
  Recipe(recipeName: "Raviolli", recipeCuisine: "Italian", likes: 3),
  Recipe(recipeName: "Sunday Roast", recipeCuisine: "British", likes: 3),
  Recipe(recipeName: "Kebabs", recipeCuisine: "Lebanese", likes: 3),
  Recipe(recipeName: "Bread", recipeCuisine: "International", likes: 3),
  Recipe(recipeName: "Duck stir fry", recipeCuisine: "Chinese", likes: 3),
  Recipe(recipeName: "Ceviche", recipeCuisine: "Peruvian", likes: 3),
  Recipe(recipeName: "Burritos", recipeCuisine: "Mexican", likes: 3),
  Recipe(recipeName: "Pho", recipeCuisine: "Vietnamese", likes: 3),
  Recipe(recipeName: "Dim Sums", recipeCuisine: "Hong Kong", likes: 3),
  Recipe(recipeName: "Tagines", recipeCuisine: "Moroccon", likes: 3),
  Recipe(recipeName: "Fish and chips", recipeCuisine: "British", likes: 3),

];