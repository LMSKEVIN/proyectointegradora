import 'dart:developer';
import 'package:integradoraproyect/constant/const.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static connect() async {
    var db = await Db.create(mongoURL);
    await db.open();
    inspect(db);
    var collection = db.collection(colectionName);
  }
}
