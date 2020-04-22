import 'package:flutter/material.dart';

class GetIngredientsForRecipes extends StatefulWidget {
  @override
  _GetIngredientsForRecipesState createState() =>
      _GetIngredientsForRecipesState();
}

class _GetIngredientsForRecipesState extends State<GetIngredientsForRecipes> {
  int _selectedIndex = 0;

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
      body: SingleChildScrollView(
          child: Column(children: <Widget>[
        _ingredientTitle('Croissants'),
        _ingredientItem('500g strong white flour, plus extra for dusting'),
        _ingredientItem('1½ tsp salt'),
        _ingredientItem('50g sugar'),
        _ingredientItem('2 x 7g sachets fast-action dried yeast'),
        _ingredientItem('oil, for greasing'),
        _ingredientItem('300g butter, at room temperature'),
        _ingredientItem('1 egg, beaten'),
        _ingredientTitle('Chicken pasta bake'),
        _ingredientItem('4 tbsp olive oil'),
        _ingredientItem('1 onion, finely chopped'),
        _ingredientItem('2 garlic cloves, crushed'),
        _ingredientItem('¼ tsp chilli flakes'),
        _ingredientItem('2 x 400g cans chopped tomatoes'),
        _ingredientItem('1 tsp caster sugar'),
        _ingredientItem('6 tbsp mascarpone'),
        _ingredientItem('4 skinless chicken breasts, sliced into strips'),
        _ingredientItem('300g penne'),
        _ingredientItem('70g mature cheddar, grated'),
        _ingredientItem('50g grated mozzarella'),
        _ingredientItem('½ small bunch of parsley, finely chopped'),
        _ingredientTitle('Roast salmon with preserved lemon'),
        _ingredientItem('40g preserved lemon, flesh and pith removed'),
        _ingredientItem('100ml gin'),
        _ingredientItem('1kg side organic farmed or wild salmon (tail end)'),
        _ingredientItem('50g sea salt'),
        _ingredientItem('50g golden caster sugar'),
        _ingredientItem('1 tsp thyme leaves'),
        _ingredientItem('1 tsp chilli flakes'),
        _ingredientItem('½ small bunch dill, washed'),
        _ingredientItem('30g preserved lemons, seeds removed'),
        _ingredientItem('4 tbsp olive oil'),
      ])),
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

  // TODO - fixme later
  List<Widget> _mainWidgetOptions = <Widget>[
    _getNewlyAdded(),
    _getTrendingHigh(),
    _getChefsSpecials(),
  ];

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
