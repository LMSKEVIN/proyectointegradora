import 'package:flutter/material.dart';
import 'package:integradoraproyect/db/mongodb.dart';
import 'package:integradoraproyect/fichausuario.dart';
import 'package:integradoraproyect/model/user.dart';

class Prueba extends StatefulWidget {
  Prueba({Key? key}) : super(key: key);

  @override
  State<Prueba> createState() => _PruebaState();
}

class _PruebaState extends State<Prueba> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: MongoDB.getUser(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: Colors.white,
              child: const LinearProgressIndicator(
                backgroundColor: Colors.black,
              ),
            );
          } else if (snapshot.hasError) {
            return Container(
              color: Colors.white,
              child: const Center(child: Text("Lo sentimos hubo un error")),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Usuarios"),
              ),
              body: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FichaUsuario(
                      usuario: User.fromMap(snapshot.data[index]),
                      onTapDelete: () async {
                        _eliminarJugador(User.fromMap(snapshot.data[index]));
                      },
                      onTapEdit: () async {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (BuildContext context) {
                            return EditarUsuario();
                          },
                        ));
                      },
                    ),
                  );
                },
                itemCount: snapshot.data.length,
              ),
            );
          }
        });
  }
}

_eliminarJugador(User user) async {
  await MongoDB.eliminar(user);
  setState(() {});
}
