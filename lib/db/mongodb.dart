import 'dart:developer';
import 'package:integradoraproyect/constant/const.dart';
import 'package:integradoraproyect/model/user.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static var db, collection;
  static connect() async {
    db = await Db.create(mongoURL);
    await db.open();
    inspect(db);
    collection = db.collection(colectionName);
  }

  static Future<List<Map<String, dynamic>>> getUsuario() async {
    try {
      final usuario = await collection.find().toList();
      return usuario;
    } catch (e) {
      print(e);
      return Future.value();
    }
  }

  static insertar(Usuario usuario) async {
    await collection.insertAll([usuario.toMap()]);
  }

  static actualizar(Usuario usuario) async {
    var u = await collection.findOne({/*'_id': usuario.id*/});
    u['user'] = usuario.user;
    u['password'] = usuario.password;
  }

  /*static eliminar(Usuario usuario) async {
    await collection.remove(where.id(usuario.id));
  }*/
}
