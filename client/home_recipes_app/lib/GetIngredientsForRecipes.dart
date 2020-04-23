import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homerecipes/api/RecipesService.dart';
import 'package:homerecipes/generated/defs/recipes-service.pb.dart';

class GetIngredientsForRecipes extends StatefulWidget {
  @override
  _GetIngredientsForRecipesState createState() =>
      _GetIngredientsForRecipesState();
}

class _GetIngredientsForRecipesState extends State<GetIngredientsForRecipes> {
  int _selectedIndex = 0;

  final List<Widget> titleAndIngredientsList = [];

  void getDataFromServer() {
    titleAndIngredientsList.clear();

    var streamController = new StreamController<GetIngredientsForAllRecipesResponse>();
    RecipesService.getIngredientsForAllRecipes(_selectedIndex, streamController);

    streamController.stream.listen((data) {
      final name = data.ingredient.name;

      setState(() {
        if(name.contains('recipe:')) { // This is a hack - to be fixed by improving the data model
          String recipeTitle = name.substring(name.indexOf(':') + 1);
          titleAndIngredientsList.add(_ingredientTitle(recipeTitle));
        } else {
          titleAndIngredientsList.add(_ingredientItem(name));
        }
      });
    });
  }

  @override
  void initState() {
    getDataFromServer();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    getDataFromServer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get ingredients details'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
          child: Column(
              children: titleAndIngredientsList
          )),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.fiber_new),
            title: Text('Newly added'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            title: Text('Trending high'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.room_service),
            title: Text('Chef Specials'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _ingredientTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: TextStyle(
              color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _ingredientItem(String item) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, bottom: 4.0),
        child: Text(item),
      ),
    );
  }

  Widget _titleContainer(String myTitle) {
    return Text(
      myTitle,
      style: TextStyle(
          color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
    );
  }
}
