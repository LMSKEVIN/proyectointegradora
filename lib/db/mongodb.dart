import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:integradoraproyect/constant/const.dart';
import 'package:integradoraproyect/model/user.dart';
import 'package:mongo_dart/mongo_dart.dart';
import '../model/recados.dart';

class MongoDatabase {
  static var collection;
  static var collection2;
  static connect() async {
    var db = await Db.create(mongoURL);
    await db.open();
    inspect(db);
    collection = db.collection(colectionName);
    collection2 = db.collection(colectionName2);
  }
  static disconect() async{
    var db = await Db.create(mongoURL);
    db.close();
  }

  static Future<List<Map<String, dynamic>>> getArduino() async {
    try {
      final usuario = await collection2
          .find(where.eq('sensores.nombre', 'MODEL-32'))
          .toList();
      return usuario;
    } catch (e) {
      return Future.value();
    }
  }

  static Future<List<Map<String, dynamic>>> getLista(String user) async {
    try {
      final usuario =
          await collection.find(where.eq('userdata.user', user)).toList();
      return usuario;
    } catch (e) {
      return Future.value();
    }
  }

  static insertaruser(Usuario usuario) async {
    await collection.insertAll([usuario.toMap()]);
  }

  static logUsuario(
      TextEditingController user, TextEditingController pass) async {
    var u = await collection.findOne({
      'userdata.user': user.text.toString(),
      'userdata.password': pass.text.toString()
    });
    return u;
  }

  static actualizar(String usuario, Recados recados) async {
    await collection.update(where.eq('userdata.user', usuario),
        modify.push('list', recados.toMap()));
  }
  /*
  static eliminarList(String user, int index)async{
    await collection.update(where.eq('userdata.user', user), modify.pull('index', ));
  }*/
}
