import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:integradoraproyect/constant/const.dart';
import 'package:integradoraproyect/model/user.dart';
import 'package:mongo_dart/mongo_dart.dart';

import '../model/recados.dart';

class MongoDatabase {
  static var collection;
  static connect() async {
    var db = await Db.create(mongoURL);
    await db.open();
    inspect(db);
    collection = db.collection(colectionName);
  }

  static Future<List<Map<String, dynamic>>> getUsuario() async {
    try {
      final usuario = await collection.find().toList();
      return usuario;
    } catch (e) {
      return Future.value();
    }
  }

  static insertaruser(Usuario usuario) async {
    await collection.insertAll([usuario.toMap()]);
  }
  static insertarlista(Usuario usuario, Recados recados) async {
    await collection.insert(where.eq('userdata.user', usuario.user));
  }
  static logUsuario(TextEditingController user, TextEditingController pass) async{
    var u = await collection.findOne({'userdata.user': user.text.toString(), 'userdata.password': pass.text.toString()});
    return u;
  }

  static actualizar(Usuario usuario, Recados recados) async {
    var u = await collection.update(where.eq('userdata.user', usuario.user), modify.push('list', recados.toMap()));
  }
  static eliminar(Usuario usuario) async{
    await collection.remove(where.eq('user', usuario.user));
  }
  
}
