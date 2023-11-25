import 'package:sqflite/sqflite.dart';
import 'package:target/app/database/database_config.dart';
import 'package:target/app/models/information_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class InformationController {
  DatabaseConfig databaseConfig = DatabaseConfig();

  // Pegar todas as informações
  Future<List<Information>> listar() async {
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

  Future<void> saveOnSubmit(String text) async {
    Information information =
        Information(0, text);
    await save(information);
  }

  // Salvar
  Future<bool> save(Information information) async {
    Database db = await databaseConfig.getDatabase();
    bool success = false;

    try {
      await db.insert('information', information.toMapExceptId());
      print('Dados salvos no banco de dados: ${information.toMapExceptId()}');
      await _saveToSharedPreferences(information);
      success = true;
    } catch (err) {
      print('Erro ao salvar dados no banco de dados: $err');
      success = false;
    }

    return success;
  }

  Future<void> _saveToSharedPreferences(Information information) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> informationList =
        prefs.getStringList('informationList') ?? [];

    informationList.add(information.information);
    prefs.setStringList('informationList', informationList);
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
      await _updateSharedPreferences(information);
      success = true;
    } catch (err) {
      success = false;
    }

    return success;
  }

  Future<void> _updateSharedPreferences(Information information) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> informationList =
        prefs.getStringList('informationList') ?? [];

    int index = informationList.indexOf(information.information);
    if (index != -1) {
      informationList[index] = information.information;
      prefs.setStringList('informationList', informationList);
    }
  }

  // Deletar
  Future<void> delete(int informationId) async {
    Database db = await databaseConfig.getDatabase();

    await db.delete('information', where: 'id = ?', whereArgs: [informationId]);
    await _deleteFromSharedPreferences(informationId);
  }

  Future<void> _deleteFromSharedPreferences(int informationId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> informationList =
        prefs.getStringList('informationList') ?? [];

    informationList.removeWhere((info) =>
    informationId.toString() == info.split('_').first);
    prefs.setStringList('informationList', informationList);
  }
}
