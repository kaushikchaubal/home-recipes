import 'package:flutter/material.dart';

class GetIngredientsForRecipes extends StatefulWidget {
  @override
  _GetIngredientsForRecipesState createState() =>
      _GetIngredientsForRecipesState();
}

class _GetIngredientsForRecipesState extends State<GetIngredientsForRecipes> {
  int _selectedIndex = 0;

  List<Widget> _mainWidgetOptions = <Widget>[
    _getNewlyAdded(),
    _getTrendingHigh(),
    _getChefsSpecials(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get ingredients details'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: _mainWidgetOptions.elementAt(_selectedIndex),
      ),
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

  static Widget _getNewlyAdded() {
    return Text(
      '1. Implement me',
    );
  }

  static Widget _getTrendingHigh() {
    return Text(
      '2. Implement me',
    );
  }

  static Widget _getChefsSpecials() {
    return Text(
      '3. Implement me',
    );
  }
}
