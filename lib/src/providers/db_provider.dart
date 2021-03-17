import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database _database;

  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  Future<Database> initDB() async {
    // Path de donde almacenaremos la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'test.db');
    print(path);

    // Crear base de datos
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE tabla(
            id INTEGER PRIMARY KEY,
            value TEXT
          )
        ''');
      },
    );
  }

  Future<int> insert(String value) async {
    final db = await database;

    final resID = await db.rawInsert('''
      INSERT INTO tabla(value )
        VALUES( '$value' )
    ''');

    return resID;
  }

  Future<String> getAll() async {
    final db = await database;
    final res = await db.query('tabla');

    return res.isNotEmpty ? res.toString() : null;
  }
}
