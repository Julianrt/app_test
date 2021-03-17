import 'package:flutter/material.dart';

import 'package:app_test/src/providers/db_provider.dart';

class SQLitePage extends StatefulWidget {
  @override
  _SQLitePageState createState() => _SQLitePageState();
}

class _SQLitePageState extends State<SQLitePage> {
  final formKey = GlobalKey<FormState>();

  String _texto = '';

  DBProvider _conn = DBProvider.db;

  @override
  void initState() {
    super.initState();

    _conn.database;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite'),
      ),
      body: _futureBuilder(),
    );
  }

  Widget _futureBuilder() {
    return FutureBuilder(
      future: _conn.getAll(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) _texto = snapshot.data;

        return Center(
          child: Column(
            children: <Widget>[
              _textSQLiteValue(),
              SizedBox(height: 25.0),
              _form(),
            ],
          ),
        );
      },
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
      onPressed: _saveValue,
    );
  }

  void _saveValue() async {
    formKey.currentState.save();
    final int _respID = await _conn.insert(_texto);
    print('el id deel registro es $_respID');
    Navigator.pop(context);
  }
}
