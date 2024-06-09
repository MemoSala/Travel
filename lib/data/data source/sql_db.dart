import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'sql_tools.dart';
import 'table.dart';

class SqlDB with SQLTools {
  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _intialDb();
    return _database;
  }

  Future<Database> _intialDb() async {
    String databasePath = await getDatabasesPath(); // Path Folder DB
    String path = join(databasePath, 'sql.db'); // Create Path DB
    Database mydb = await openDatabase(
      path,
      onCreate: _createDB,
      onUpgrade: _upgradeDB,
      version: 1,
    );
    return mydb;
  }

  void _createDB(Database db, int version) async {
    Batch batch = db.batch();
    batch.execute('''
      $create '${TABLE.favorite}' (
        id $text $vNutNull $primaryKey
      );
    ''');
    batch.execute('''
      $create '${TABLE.deleted}' (
        id $text $vNutNull $primaryKey
      );
    ''');
    await batch.commit();
  }

  void _upgradeDB(Database db, int oldVersion, int newVersion) async {}

//--SQL-------------------------------------------------------------------------
  Future<List<Map<String, Object?>>> readData({required String from}) async {
    Database? mydb = await database;
    List<Map<String, Object?>> listMap =
        await mydb!.rawQuery('SELECT * FROM $from;');
    return listMap;
  }

  Future<int> insertData({required String value, required String from}) async {
    Database? mydb = await database;
    return mydb!.rawInsert("INSERT INTO $from( id ) VALUES('$value')");
  }

  Future<int> deleteData({required String from, required String value}) async {
    Database? mydb = await database;
    return mydb!.rawDelete("DElETE FROM $from WHERE id = '$value'");
  }
}
