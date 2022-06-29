import 'package:mongo_dart/mongo_dart.dart';
import 'package:integradoraproyect/model/user.dart';
import 'package:integradoraproyect/constant/constantes.dart';

class MongoDB {
  static var bd, coleccionUsuario;

  static conectar() async {
    bd = await Db.create(conexionBase);
    await bd.open();
    coleccionUsuario = bd.collection(coleccion);
  }

  static Future<List<Map<String, dynamic>>> getUser() async {
    try {
      final usuarios = await coleccionUsuario.find().toList();
      return usuarios;
    } catch (e) {
      print(e);
      return Future.value();
    }
  }

  static insertar(User user) async {
    await coleccionUsuario.insertAll([user.toMap()]);
  }

  static actualizar(User user) async {
    var u = await coleccionUsuario.findOne({"_id": user.id});
    u["nombre"] = user.name;
    u["user"] = user.user;
    u["email"] = user.email;
    u["password"] = user.password;
    await coleccionUsuario.save(u);
  }

  static eliminar(User user) async {
    await coleccionUsuario.remove(where.id(user.id));
  }
}
