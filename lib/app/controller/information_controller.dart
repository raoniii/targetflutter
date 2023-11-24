import 'package:sqflite/sqflite.dart';
import 'package:target/app/database/database_config.dart';
import 'package:target/app/models/information_model.dart';

class InformationController {
  DatabaseConfig databaseConfig = DatabaseConfig();

  // Pegar todas as informações
  Future<List<Information>> index() async {
    Database db = await databaseConfig.getDatabase();
    List<Map<String, dynamic>> maps =
    await db.query('information', orderBy: 'id ASC');

    return List.generate(maps.length, (index) {
      return Information(
        maps[index]['id'],
        maps[index]['information'],
      );
    });
  }

  // Salvar
  Future<bool> save(Information information) async {
    Database db = await databaseConfig.getDatabase();
    bool success = false;

    try {
      await db.insert('information', information.toMap());
      success = true;
    } catch (err) {
      success = false;
    }

    return success;
  }

  // Atualizar
  Future<bool> update(Information information) async {
    Database db = await databaseConfig.getDatabase();
    bool success = false;

    try {
      await db.update(
        'information',
        information.toMap(),
        where: 'id = ?',
        whereArgs: [information.id],
      );
      success = true;
    } catch (err) {
      success = false;
    }

    return success;
  }

  // Deletar
  Future<void> delete(int informationId) async {
    Database db = await databaseConfig.getDatabase();

    await db.delete('information', where: 'id = ?', whereArgs: [informationId]);
  }
}
