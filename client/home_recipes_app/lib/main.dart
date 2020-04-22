import 'package:flutter/material.dart';

void main() => runApp(HomeRecipesApp());

class HomeRecipesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                FlatButton(
                  child: Card(
                      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.fastfood,
                          color: Colors.teal,
                        ),
                        title: Text(
                          'Show all the recipes available',
                          style: TextStyle(
                            color: Colors.teal.shade900,
                            fontFamily: 'Source Sans Pro',
                            fontSize: 20.0,
                          ),
                        ),
                      )),
                ),
                FlatButton(
                  child: Card(
                      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.kitchen,
                          color: Colors.teal,
                        ),
                        title: Text(
                          'List ingredients in your kitchen',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.teal.shade900,
                              fontFamily: 'Source Sans Pro'),
                        ),
                      )),
                ),
                FlatButton(
                  child: Card(
                      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.cake,
                          color: Colors.teal,
                        ),
                        title: Text(
                          'Get ingredients for recipes',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.teal.shade900,
                              fontFamily: 'Source Sans Pro'),
                        ),
                      )),
                )
              ],
            )),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Add Recipe',
          backgroundColor: Colors.white,
          child: Icon(
              Icons.add,
              color: Colors.teal,
          ),
        ),
      ),
    );
  }
}
