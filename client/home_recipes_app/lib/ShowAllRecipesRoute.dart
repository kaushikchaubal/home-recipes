import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homerecipes/api/RecipesService.dart';
import 'package:homerecipes/generated/defs/recipes-service.pb.dart';

class ShowAllRecipesRoute extends StatefulWidget {
  @override
  _ShowAllRecipesState createState() {
    return _ShowAllRecipesState();
  }
}

class _ShowAllRecipesState extends State<ShowAllRecipesRoute> {

  final List<DataRow> rowList = [];

  @override
  void initState() {
    var streamController = new StreamController<ListAllRecipesResponse>();
    RecipesService.listAllRecipes(streamController);

    streamController.stream.listen((data) {
      final name = data.recipe.name;
      final cuisine = data.recipe.cuisine;
      print('$name and $cuisine');

      setState(() {
        rowList.add(DataRow(cells: <DataCell>[
          DataCell(Text(name)),
          DataCell(Text(cuisine)),
        ]));
      });

    });
  }

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
            ],
            rows: rowList,
          ),
        ]));
  }
}

class ClientRecipe {
  String recipeName;
  String recipeCuisine;
  int likes;

  ClientRecipe({this.recipeName, this.recipeCuisine, this.likes});
}

// Currently hardcoded list of recipes on the client. This will be streamed by the server
var recipes = <ClientRecipe>[
  ClientRecipe(recipeName: "Pizza", recipeCuisine: "Italian", likes: 3),
  ClientRecipe(recipeName: "Beef Burgers", recipeCuisine: "American", likes: 3),
  ClientRecipe(recipeName: "Croissants", recipeCuisine: "French", likes: 3),
  ClientRecipe(recipeName: "Katsu Curry", recipeCuisine: "Japanese", likes: 3),
  ClientRecipe(recipeName: "Butter Chicken", recipeCuisine: "Indian", likes: 3),
  ClientRecipe(recipeName: "Raviolli", recipeCuisine: "Italian", likes: 3),
  ClientRecipe(recipeName: "Sunday Roast", recipeCuisine: "British", likes: 3),
  ClientRecipe(recipeName: "Kebabs", recipeCuisine: "Lebanese", likes: 3),
  ClientRecipe(recipeName: "Bread", recipeCuisine: "International", likes: 3),
  ClientRecipe(recipeName: "Duck stir fry", recipeCuisine: "Chinese", likes: 3),
  ClientRecipe(recipeName: "Ceviche", recipeCuisine: "Peruvian", likes: 3),
  ClientRecipe(recipeName: "Burritos", recipeCuisine: "Mexican", likes: 3),
  ClientRecipe(recipeName: "Pho", recipeCuisine: "Vietnamese", likes: 3),
  ClientRecipe(recipeName: "Dim Sums", recipeCuisine: "Hong Kong", likes: 3),
  ClientRecipe(recipeName: "Tagines", recipeCuisine: "Moroccon", likes: 3),
  ClientRecipe(recipeName: "Fish and chips", recipeCuisine: "British", likes: 3),

];