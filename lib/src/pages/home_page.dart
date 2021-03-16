import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('APP TEST'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            _btnQR(context),
            _btnAPI(context),
            _btnPreferences(context),
            _btnSQLite(context),
          ],
        ),
      ),
    );
  }

  Widget _btnQR(BuildContext context) {
    return RaisedButton(
      child: Text('Leer QR'),
      onPressed: () => Navigator.pushNamed(context, '/qr'),
    );
  }

  Widget _btnAPI(BuildContext context) {
    return RaisedButton(
      child: Text('Consumir API'),
      onPressed: () => Navigator.pushNamed(context, '/api'),
    );
  }

  Widget _btnPreferences(BuildContext context) {
    return RaisedButton(
      child: Text('Preferencias'),
      onPressed: () => Navigator.pushNamed(context, '/preferences'),
    );
  }

  Widget _btnSQLite(BuildContext context) {
    return RaisedButton(
      child: Text('SQLite'),
      onPressed: () => Navigator.pushNamed(context, '/sqlite'),
    );
  }
}
