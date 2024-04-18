import 'package:flutter_application_2/features/dash/model/repo/parent_data.dart';
import 'package:sqflite/sqflite.dart';

class LocalDBData extends MyParentData {
  late Database db;
  Future<void> init() async {
    String path = await getDatabasesPath();

    db = await openDatabase(path + 'dash.db', version: 1, onCreate: (db, version) {
      db.execute('''
CREATE TABLE Users(
  id INTEGER PRIMARY KEY AUTINCREMENT,
  name TEXT NOT NULL,
  address TEXT
)
''');
    });
  }

  @override
  Future<void> delete({required Comparable<num> id}) async {
    await db.delete('users', where: 'id=?', whereArgs: [id]);
  }

  @override
  Future<List> fetch() async {
    return await db.query('Users');
  }

  @override
  Future<void> insert({required String name, String? address}) async {
    await db.insert('users', {'name': name, 'address': address});
  }
}
