import 'package:flutter/material.dart';
import 'package:integradoraproyect/api/api.dart';
import 'package:integradoraproyect/db/mongodb.dart';
import 'package:integradoraproyect/widgets/datos.dart';
import 'package:integradoraproyect/widgets/spinner.dart';

class Exterior extends StatefulWidget {
  Exterior({Key? key, required this.datos}) : super(key: key);

  final datos;
  @override
  State<Exterior> createState() => _ExteriorState();
}

class _ExteriorState extends State<Exterior> {
  final TextEditingController cantidadController = TextEditingController();
  final TextEditingController concepController = TextEditingController();
  void formaDatos() async {
    return await showModalBottomSheet(
        elevation: 5,
        isScrollControlled: true,
        context: context,
        builder: (_) =>
            formatoRegistro(concepController, cantidadController, context));
  }

  _imgLoader(double dat) {
    dat = dat - 273.15;
    var img;
    if (dat < 10) {
      img = 'assets/low.png';
      return img;
    } else if (dat > 10 && dat <= 30) {
      img = 'assets/mid.png';
      return img;
    } else {
      img = 'assets/sun.png';
      return img;
    }
  }

  _limDatos(double dat) {
    dat = dat - 273.15;
    return dat;
  }

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
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.width,
                  child: FutureBuilder(
                    future: apiDatos(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          height: 190.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 24.0),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                height: 190,
                                width: 500,
                                margin: const EdgeInsets.only(left: 46.0),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 170, 68, 101),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(8.0),
                                  boxShadow: const <BoxShadow>[
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 10.0,
                                      offset: Offset(0.0, 10.0),
                                    )
                                  ],
                                ),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 70,
                                          ),
                                          Text(
                                            snapshot.data['name'].toString(),
                                            style: const TextStyle(
                                              fontSize: 25,
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 70,
                                          ),
                                          Text(
                                            _limDatos(double.parse(snapshot
                                                    .data['main']['temp']
                                                    .toString()))
                                                .toStringAsFixed(0),
                                            style: const TextStyle(
                                              fontSize: 70,
                                              color: Colors.cyan,
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              SizedBox(
                                                height: 30,
                                                child: Text(
                                                  '°',
                                                  style: TextStyle(
                                                    fontSize: 40,
                                                    color: Colors.cyan,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 50,
                                                child: Text(
                                                  'C',
                                                  style: TextStyle(
                                                    fontSize: 40,
                                                    color: Colors.cyan,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Sensación térmica: ${_limDatos(double.parse(snapshot.data['main']['feels_like'].toString())).toStringAsFixed(0)}°C     ',
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Temperatura mínima: ${_limDatos(double.parse(snapshot.data['main']['temp_min'].toString())).toStringAsFixed(0)}°C',
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                alignment: FractionalOffset.centerLeft,
                                child: Image(
                                  image: AssetImage(_imgLoader(double.parse(
                                      snapshot.data['main']['temp']
                                          .toString()))),
                                  height: 100.0,
                                  width: 120.0,
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Center(
                          child: spinner(context),
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    child: FutureBuilder(
                      future: MongoDatabase.getLista('Arnold'),
                      builder: ((context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            itemCount: snapshot.data[0]['list'].length,
                            itemBuilder: (context, index) {
                              return FutureBuilder(
                                future: MongoDatabase.getLista('Arnold'),
                                builder: ((context, AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    return ListView.builder(
                                      itemCount:
                                          snapshot.data[0]['list'].length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 70,
                                                width: 500,
                                                margin: const EdgeInsets.only(
                                                    left: 46.0, right: 46.0),
                                                decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                      255, 170, 68, 101),
                                                  shape: BoxShape.rectangle,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  boxShadow: const <BoxShadow>[
                                                    BoxShadow(
                                                      color: Colors.black12,
                                                      blurRadius: 10.0,
                                                    )
                                                  ],
                                                ),
                                                child: Text('hola'),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  } else {
                                    return Center(
                                      child: spinner(context),
                                    );
                                  }
                                }),
                              );
                            },
                          );
                        } else {
                          return Center(
                            child: spinner(context),
                          );
                        }
                      }),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      child: const Icon(Icons.add),
                      backgroundColor: Colors.amber,
                      onPressed: () {
                        formaDatos();
                      },
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
