import 'package:flutter/material.dart';

class SQLitePage extends StatefulWidget {
  @override
  _SQLitePageState createState() => _SQLitePageState();
}

class _SQLitePageState extends State<SQLitePage> {
  final formKey = GlobalKey<FormState>();

  String _texto = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            _textSQLiteValue(),
            SizedBox(height: 25.0),
            _form(),
          ],
        ),
      ),
    );
  }

  Widget _textSQLiteValue() {
    return Text('El valor en la bd es: $_texto');
  }

  Widget _form() {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          _txtField(),
          _btnSave(),
        ],
      ),
    );
  }

  Widget _txtField() {
    return TextFormField(
      decoration: new InputDecoration(
        labelText: 'Valor del campo',
      ),
      onSaved: (value) => _texto = value,
    );
  }

  Widget _btnSave() {
    return RaisedButton(
        child: Text('Guardar'),
        onPressed: () {
          formKey.currentState.save();
        });
  }
}
