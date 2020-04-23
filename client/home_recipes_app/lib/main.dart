import 'package:flutter/material.dart';
import 'AddRecipeRoute.dart';
import 'ShowAllRecipesRoute.dart';
import 'ListIngredientsInKitchenRoute.dart';
import 'GetIngredientsForRecipes.dart';

void main() => runApp(HomeRecipesApp());

class HomeRecipesApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePageRoute(),
    );
  }
}

class HomePageRoute extends StatelessWidget {

  FlatButton createFlatButton(String title, Icon icon, VoidCallback callback) {
    return FlatButton(
      onPressed: callback,
      child: Card(
          margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: ListTile(
            leading: icon,
            title: Text(
              title,
              style: TextStyle(
                color: Colors.teal.shade900,
                fontFamily: 'Source Sans Pro',
                fontSize: 20.0,
              ),
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage('images/main-icon.png'),
            backgroundColor: Colors.white,
          ),
          Text(
            'Home Recipes',
            style: TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 40.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'COOKING. SHARING. THRIVING.',
            style: TextStyle(
              fontFamily: 'Source Sans Pro',
              color: Colors.teal.shade100,
              fontSize: 20.0,
              letterSpacing: 2.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.0,
            width: 150.0,
            child: Divider(
              color: Colors.teal.shade100,
            ),
          ),
          createFlatButton(
            'Show all the recipes available',
            Icon(Icons.fastfood, color: Colors.teal),
            () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => ShowAllRecipesRoute())),
          ),
          createFlatButton(
            'List ingredients in your kitchen',
            Icon(Icons.kitchen, color: Colors.teal),
            () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ListIngredientsInKitchenRoute())),
          ),
          createFlatButton(
            'Get ingredients for recipes',
            Icon(Icons.cake, color: Colors.teal),
            () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GetIngredientsForRecipes())),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => AddRecipeRoute())),
        tooltip: 'Add Recipe',
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: Colors.teal,
        ),
      ),
    );
  }


}
