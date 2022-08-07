import 'package:flutter/material.dart';
import 'package:integradoraproyect/constant/datosuser.dart';
import 'package:integradoraproyect/db/mongodb.dart';
import 'package:integradoraproyect/widgets/spinner.dart';

import '../model/recados.dart';
import '../widgets/datos.dart';

class Notas extends StatefulWidget {
  Notas({Key? key}) : super(key: key);

  @override
  State<Notas> createState() => _NotasState();
}

class _NotasState extends State<Notas> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  void formaDatos() async {
    return await showModalBottomSheet(
        elevation: 5,
        isScrollControlled: true,
        context: context,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 10,
                  bottom: 50 + MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(hintText: "Titulo:"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: descriptionController,
                    decoration: const InputDecoration(hintText: "Descripcion:"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: _agregarDatos, child: const Text("Guardar"))
                ],
              ),
            ));
  }

  void _agregarDatos(){
    Recados newrecado = Recados(
                  title: titleController.text,
                  description: descriptionController.text,
                  date: DateTime.now());
    setState(() {
      MongoDatabase.actualizar(DatosUsuario.devolverDatos().toString(), newrecado);
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Bienvenido ${DatosUsuario.devolverDatos().toString()}'),
        ),
        backgroundColor: Colors.lightBlue,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                MongoDatabase.disconect();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            formaDatos();
        },
        backgroundColor: Colors.amber,
        child: const Icon(Icons.note_add),
      ),
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
              child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                future: MongoDatabase.getLista(
                    DatosUsuario.devolverDatos().toString()),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data[0]['list'].length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Card(
                              child: SizedBox(
                                height: 100,
                                width: MediaQuery.of(context).size.width / 3,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 50,
                                        ),
                                        Text(
                                          snapshot.data[0]['list'][index]
                                                  ['title']
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 25),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 50,
                                        ),
                                        Expanded(
                                          child: Text(
                                            snapshot.data[0]['list'][index]
                                                    ['description']
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.indigo,
                                                fontSize: 20),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  } else {
                    return spinner(context);
                  }
                },
              ),
            ),
          ),),
        ),
      ),
    );
  }
}
