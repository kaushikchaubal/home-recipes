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