import 'package:flutter/material.dart';

class ListIngredientsInKitchenRoute extends StatefulWidget {
  @override
  _ListIngredientsInKitchenState createState() => _ListIngredientsInKitchenState();
}

class _ListIngredientsInKitchenState extends State<ListIngredientsInKitchenRoute> {
  int _value = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
              padding: const EdgeInsets.only(left:8.0),
              child: Align
                (
                alignment: Alignment.centerLeft,
                child: Container(
                    child: Wrap(
                      spacing: 5.0,
                      runSpacing: 3.0,
                      children: <Widget>[
                        filterChipWidget(chipName: 'Flour'),
                        filterChipWidget(chipName: 'Oil'),
                        filterChipWidget(chipName: 'Milk'),
                        filterChipWidget(chipName: 'Eggs'),
                        filterChipWidget(chipName: 'Cheese'),
                        filterChipWidget(chipName: 'Rice'),
                        filterChipWidget(chipName: 'Salt'),
                        filterChipWidget(chipName: 'Butter'),
                        filterChipWidget(chipName: 'Sugar'),
                      ],
                    )
                ),
              ),
            ),
            Divider(color: Colors.blueGrey, height: 10.0,),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _titleContainer("Meat / Fish"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Align
                (
                alignment: Alignment.centerLeft,
                child: Container(
                    child: Wrap(
                      spacing: 5.0,
                      runSpacing: 3.0,
                      children: <Widget>[
                        filterChipWidget(chipName: 'Chicken'),
                        filterChipWidget(chipName: 'Pork'),
                        filterChipWidget(chipName: 'Lamb'),
                        filterChipWidget(chipName: 'Beef'),
                        filterChipWidget(chipName: 'Turkey'),
                        filterChipWidget(chipName: 'Prawns'),
                        filterChipWidget(chipName: 'Haddock'),
                        filterChipWidget(chipName: 'Cod'),
                      ],
                    )
                ),
              ),
            ),
            Divider(color: Colors.blueGrey, height: 10.0,),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _titleContainer('Vegetables'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Align
                (
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Wrap(
                    spacing: 5.0,
                    runSpacing: 5.0,
                    children: <Widget>[
                      filterChipWidget(chipName: 'Brocolli'),
                      filterChipWidget(chipName: 'Carrots'),
                      filterChipWidget(chipName: 'Tomatoes'),
                      filterChipWidget(chipName: 'Green Beans'),
                      filterChipWidget(chipName: 'Sweet Corn'),
                      filterChipWidget(chipName: 'Aubergines'),
                      filterChipWidget(chipName: 'Bell Peppers'),
                    ],
                  ),
                ),
              ),
            ),
            Divider(color: Colors.blueGrey, height: 10.0,),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _titleContainer('Spices'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Align
                (
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Wrap(
                    spacing: 5.0,
                    runSpacing: 5.0,
                    children: <Widget>[
                      filterChipWidget(chipName: 'Paprika '),
                      filterChipWidget(chipName: 'Grounded Pepper'),
                      filterChipWidget(chipName: 'Turmeric'),
                    ],
                  ),
                ),
              ),
            ),
            Divider(color: Colors.blueGrey, height: 10.0,),
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

class filterChipWidget extends StatefulWidget {
  final String chipName;

  filterChipWidget({Key key, this.chipName}) : super(key: key);

  @override
  _filterChipWidgetState createState() => _filterChipWidgetState();
}

class _filterChipWidgetState extends State<filterChipWidget> {
  var _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.chipName),
      labelStyle: TextStyle(color: Colors.white,fontSize: 16.0,fontWeight: FontWeight.bold),
      selected: _isSelected,
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            30.0),),
      backgroundColor: Colors.teal.shade200,
      onSelected: (isSelected) {
        setState(() {
          _isSelected = isSelected;
        });
      },
      selectedColor: Colors.teal.shade600,

    );
  }
}