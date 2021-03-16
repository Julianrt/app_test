import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class APIPage extends StatefulWidget {
  @override
  _APIPageState createState() => _APIPageState();
}

class _APIPageState extends State<APIPage> {
  String _response = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            _btnCallAPI(),
            SizedBox(height: 25.0),
            _textAPIResponse(),
          ],
        ),
      ),
    );
  }

  Widget _btnCallAPI() {
    return RaisedButton(
      child: Text('Llamar a la api'),
      onPressed: () {
        _callAPI();
      },
    );
  }

  Widget _textAPIResponse() {
    return Text('Response: $_response');
  }

  void _callAPI() async {
    await _request();
    setState(() {});
  }

  Future<void> _request() async {
    final String _url = 'https://pokeapi.co/api/v2/pokemon';

    final response = await http.get(_url);
    if (response.statusCode != 200) return null;

    _response = response.body;
  }
}
