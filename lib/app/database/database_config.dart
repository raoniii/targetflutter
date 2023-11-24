import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseConfig{

  Future<Database> getDatabase() async{
    return openDatabase(
      join(await getDatabasesPath(), 'target_database.db'),
      onCreate: (db, version) async{
        await cretaTable(db);
      },
      onOpen: (db) {},
      onUpgrade: (db, oldVersion, newVersion) async{},
      onDowngrade: (db, oldVersion, newVersion) async{},
      version: 1,
    );
  }

  Future cretaTable(Database db) async{
    await db.execute(
      'CREATE TABLE IF NOT EXISIS information(id INTEGER PRIMARY KEY, information TEXT NOT NULL);');
  }

}
