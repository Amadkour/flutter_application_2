import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDatabase {
  MyDatabase.init();
  static MyDatabase? object;
  static Database? _database;
  static Future<MyDatabase> get instance async {
    if (object == null) {
      await _initDatabase();
      return MyDatabase.init();
    }
    return object!;
  }

  ///create database
  static Future<void> _initDatabase() async {
    ///get database path on the target device
    final databasePath = await getDatabasesPath();

    ///add your database files
    ///equal to databasePath+"/notes.db"
    final path = join(databasePath, 'notes.db');
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: createTables,
    );
  }

  static Future<void> createTables(Database db, _) async {
    await db.execute("""
CREATE TABLE users (
id INTEGER PRIMARY KEY AUTOINCREMENT, 
name TEXT NOT NULL, 
address TEXT )
""");
  }

  Future<void> insert(String name, String address) async {
    await _database!.insert('users', {'name': name, 'address': address});
  }

  Future<List<Map<String, Object?>>> read() async {
    return await _database!.query('users');
  }

  Future<int> delete() async {
    return await _database!.delete('users', where: 'id=?', whereArgs: [1]);
  }

  Future<int> update() async {
    return await _database!.update('users', {'name': 'mostafa'}, where: 'id=?', whereArgs: [1]);
  }
}
