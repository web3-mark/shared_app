import "dart:developer";

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import './sql.dart';

export "./model.dart";
export './app.dart';
export "./tables.dart";

late String databasesPath;
late Database db;

Future initdb() async {
  databasesPath = await getDatabasesPath();

  db = await openDatabase(
    join(databasesPath, DBName),
    onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),
    onCreate: (db, version) async {
      Batch batch = db.batch();
      List tables = sqls['base'].toString().split(';');
      tables.forEach((element) {
        if (element.trim().isNotEmpty) {
          batch.execute(element);
        }
      });
      await batch.commit();
    },
    version: 1,
  );
}

// singleton class
class LocalDB {
  static final LocalDB _databaseService = LocalDB._internal();
  LocalDB._internal();

  static LocalDB get instance => _databaseService;
  static Database? _database;

  Future<Database> get database async {
    return _database ??= await _initDatabase();
  }

  _initDatabase() async {
    final dir = await getDatabasesPath();
    log('dir: $dir');

    final database = openDatabase(
      join(dir, DBName),
      onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),
      onCreate: (db, version) async {
        Batch batch = db.batch();
        List tables = sqls['base'].toString().split(';');
        tables.forEach((element) {
          if (element.trim().isNotEmpty) {
            batch.execute(element);
          }
        });
        await batch.commit();
      },
      version: 1,
    );
    return database;
  }
}
