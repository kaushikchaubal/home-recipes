import 'package:flutter/material.dart';

class AddRecipeRoute extends StatefulWidget {
  AddRecipeRoute({Key key}) : super(key: key);

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
          _formData['recipeName'] = value;
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
          _formData['recipeCuisine'] = value;
        },
      ),
    );
  }

  Widget _buildSubmitButton() {
    return FlatButton(
      onPressed: () {
        _submitForm();
        FocusScope.of(context).unfocus();
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
    );
  }

  void _submitForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(_formData);
    }
  }
}
