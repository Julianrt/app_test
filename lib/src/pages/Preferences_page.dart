import 'package:flutter/material.dart';

import 'package:app_test/src/shared_preferences/preferences.dart';

class PreferencesPage extends StatefulWidget {
  @override
  _PreferencesPageState createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  final formKey = GlobalKey<FormState>();

  final _prefs = new SharedPrefs();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferences'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            _textPreferenceValue(),
            SizedBox(height: 25.0),
            _form(context),
          ],
        ),
      ),
    );
  }

  Widget _textPreferenceValue() {
    return Text('El valor de la preferencia es: ${_prefs.campo}');
  }

  Widget _form(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          _txtField(),
          _btnSave(context),
        ],
      ),
    );
  }

  Widget _txtField() {
    return TextFormField(
      decoration: new InputDecoration(
        labelText: 'Valor del campo',
      ),
      onSaved: (value) => _prefs.campo = value,
    );
  }

  Widget _btnSave(BuildContext context) {
    return RaisedButton(
      child: Text('Guardar'),
      onPressed: () {
        formKey.currentState.save();
        Navigator.pop(context);
      },
    );
  }
}
