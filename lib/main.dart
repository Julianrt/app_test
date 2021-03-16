import 'package:flutter/material.dart';

import 'package:app_test/src/shared_preferences/preferences.dart';
import 'package:app_test/src/pages/Preferences_page.dart';
import 'package:app_test/src/pages/api_page.dart';
import 'package:app_test/src/pages/qr_page.dart';
import 'package:app_test/src/pages/sqlite_page.dart';
import 'package:app_test/src/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final _prefs = new SharedPrefs();
  await _prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/home',
      routes: {
        '/home': (BuildContext context) => HomePage(),
        '/qr': (BuildContext context) => QRPage(),
        '/api': (BuildContext context) => APIPage(),
        '/preferences': (BuildContext context) => PreferencesPage(),
        '/sqlite': (BuildContext context) => SQLitePage(),
      },
    );
  }
}
