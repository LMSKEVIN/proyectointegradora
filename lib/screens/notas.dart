import 'package:flutter/material.dart';
import 'package:integradoraproyect/constant/datosuser.dart';
import 'package:integradoraproyect/db/mongodb.dart';
import 'package:integradoraproyect/widgets/spinner.dart';

class Notas extends StatefulWidget {
  Notas({Key? key}) : super(key: key);

  @override
  State<Notas> createState() => _NotasState();
}

class _NotasState extends State<Notas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 135, 191, 255),
                Color.fromARGB(255, 254, 249, 239),
              ],
            ),
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder(
              future: MongoDatabase.getLista(
                  DatosUsuario.devolverDatos().toString()),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Title(
                          color: Colors.white,
                          child: Text(
                            'Hola ${DatosUsuario.devolverDatos().toString()}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 50),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ListView.builder(
                          itemCount: snapshot.data,
                          itemBuilder: (context, index) {
                            return Container();
                          },
                        )
                      ],
                    ),
                  );
                } else {
                  return spinner(context);
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
