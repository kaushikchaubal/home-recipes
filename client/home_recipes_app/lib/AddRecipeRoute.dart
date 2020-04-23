import 'package:flutter/material.dart';
import 'package:homerecipes/api/RecipesService.dart';

class AddRecipeRoute extends StatefulWidget {

  @override
  _AddRecipeState createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipeRoute> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {'recipeName': null, 'recipeCuisine': null};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add recipe'),
        backgroundColor: Colors.teal,
      ),
      body: _buildForm(),
    );
  }

  Widget _buildForm() {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildRecipeNameField(),
            _buildRecipeCuisineField(),
            _buildSubmitButton(),
          ],
        ));
  }

  Widget _buildRecipeNameField() {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: TextFormField(
        decoration: InputDecoration(
            hasFloatingPlaceholder: true,
            hintText: 'Enter Recipe Name'
        ),
        onSaved: (String value) {
          _formData['recipeName'] = value.trim();
        },
      ),
    );
  }

  Widget _buildRecipeCuisineField() {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: TextFormField(
        decoration: InputDecoration(
            hasFloatingPlaceholder: true,
            hintText: 'Enter Recipe Cuisine'
        ),
        onSaved: (String value) {
          _formData['recipeCuisine'] = value.trim();
        },
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Builder(
      builder: (context) => FlatButton(
        onPressed: () {
          _submitForm();
          FocusScope.of(context).unfocus();
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('New recipe added! You are awesome!'),
            backgroundColor: Colors.teal.shade500,
          ));
        },
        child: Card(
            margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
            color: Colors.teal,
            child: ListTile(
              title: Center(
                child: Text(
                  'Add recipe to database',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20.0,
                  ),
                ),
              ),
            )),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print('Adding recipe with values: $_formData');
      RecipesService.addRecipe(_formData['recipeName'], _formData['recipeCuisine']);
    }
  }
}
