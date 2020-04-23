import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homerecipes/api/RecipesService.dart';
import 'package:homerecipes/generated/defs/recipes-service.pb.dart';

class ListIngredientsInKitchenRoute extends StatefulWidget {
  @override
  _ListIngredientsInKitchenState createState() =>
      _ListIngredientsInKitchenState();
}

class _ListIngredientsInKitchenState
    extends State<ListIngredientsInKitchenRoute> {
  int _value = 5;

  @override
  Widget build(BuildContext context) {
    final streamController =
        new StreamController<ListAllIngredientsAtHomeRequest>();
    RecipesService.listAllIngredientsAtHome(streamController.stream);

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
            streamController.close();
          },
        ),
        title: Text('Ingredients in the kitchen'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _titleContainer("Basics"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    child: Wrap(
                  spacing: 5.0,
                  runSpacing: 3.0,
                  children: <Widget>[
                    FilterChipWidget(
                        chipName: 'Flour', streamController: streamController),
                    FilterChipWidget(
                        chipName: 'Oil', streamController: streamController),
                    FilterChipWidget(
                        chipName: 'Milk', streamController: streamController),
                    FilterChipWidget(
                        chipName: 'Eggs', streamController: streamController),
                    FilterChipWidget(
                        chipName: 'Cheese', streamController: streamController),
                    FilterChipWidget(
                        chipName: 'Rice', streamController: streamController),
                    FilterChipWidget(
                        chipName: 'Salt', streamController: streamController),
                    FilterChipWidget(
                        chipName: 'Butter', streamController: streamController),
                    FilterChipWidget(
                        chipName: 'Sugar', streamController: streamController),
                  ],
                )),
              ),
            ),
            Divider(
              color: Colors.blueGrey,
              height: 10.0,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _titleContainer("Meat / Fish"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    child: Wrap(
                  spacing: 5.0,
                  runSpacing: 3.0,
                  children: <Widget>[
                    FilterChipWidget(
                        chipName: 'Chicken',
                        streamController: streamController),
                    FilterChipWidget(
                        chipName: 'Pork', streamController: streamController),
                    FilterChipWidget(
                        chipName: 'Lamb', streamController: streamController),
                    FilterChipWidget(
                        chipName: 'Beef', streamController: streamController),
                    FilterChipWidget(
                        chipName: 'Turkey', streamController: streamController),
                    FilterChipWidget(
                        chipName: 'Prawns', streamController: streamController),
                    FilterChipWidget(
                        chipName: 'Haddock',
                        streamController: streamController),
                    FilterChipWidget(
                        chipName: 'Cod', streamController: streamController),
                  ],
                )),
              ),
            ),
            Divider(
              color: Colors.blueGrey,
              height: 10.0,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _titleContainer('Vegetables'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Wrap(
                    spacing: 5.0,
                    runSpacing: 5.0,
                    children: <Widget>[
                      FilterChipWidget(
                          chipName: 'Brocolli',
                          streamController: streamController),
                      FilterChipWidget(
                          chipName: 'Carrots',
                          streamController: streamController),
                      FilterChipWidget(
                          chipName: 'Tomatoes',
                          streamController: streamController),
                      FilterChipWidget(
                          chipName: 'Green Beans',
                          streamController: streamController),
                      FilterChipWidget(
                          chipName: 'Sweet Corn',
                          streamController: streamController),
                      FilterChipWidget(
                          chipName: 'Aubergines',
                          streamController: streamController),
                      FilterChipWidget(
                          chipName: 'Bell Peppers',
                          streamController: streamController),
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.blueGrey,
              height: 10.0,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _titleContainer('Spices'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Wrap(
                    spacing: 5.0,
                    runSpacing: 5.0,
                    children: <Widget>[
                      FilterChipWidget(
                          chipName: 'Paprika',
                          streamController: streamController),
                      FilterChipWidget(
                          chipName: 'Grounded Pepper',
                          streamController: streamController),
                      FilterChipWidget(
                          chipName: 'Turmeric',
                          streamController: streamController),
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.blueGrey,
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _titleContainer(String myTitle) {
  return Text(
    myTitle,
    style: TextStyle(
        color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
  );
}

class FilterChipWidget extends StatefulWidget {
  final String chipName;
  final StreamController streamController;

  FilterChipWidget({Key key, this.chipName, this.streamController})
      : super(key: key);

  @override
  _FilterChipWidgetState createState() => _FilterChipWidgetState();
}

class _FilterChipWidgetState extends State<FilterChipWidget> {
  var _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.chipName),
      labelStyle: TextStyle(
          color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
      selected: _isSelected,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      backgroundColor: Colors.teal.shade200,
      onSelected: (isSelected) {
        setState(() {
          _isSelected = isSelected;

          if (isSelected) {
            var ingredient = new Ingredient()
              ..name = widget.chipName
              ..quantity = 'Plenty';
            var request = new ListAllIngredientsAtHomeRequest()
              ..ingredient = ingredient;
            widget.streamController.add(request);
          }
        });
      },
      selectedColor: Colors.teal.shade600,
    );
  }
}
