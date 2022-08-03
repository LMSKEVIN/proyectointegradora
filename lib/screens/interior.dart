import 'package:flutter/material.dart';
import 'package:integradoraproyect/db/mongodb.dart';
import 'package:integradoraproyect/widgets/spinner.dart';

import '../constant/datosuser.dart';

class Interior extends StatefulWidget {
  Interior({Key? key}) : super(key: key);

  @override
  State<Interior> createState() => _InteriorState();
}

class _InteriorState extends State<Interior> {
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
              future: MongoDatabase.getArduino(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Title(
                          color: Colors.black,
                          child: Text(
                            'Bienvenido ${DatosUsuario.devolverDatos().toString()}',
                            style: const TextStyle(
                                fontSize: 50, color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Image(
                          image: const AssetImage('assets/casa.png'),
                          height: MediaQuery.of(context).size.height / 3,
                          width: MediaQuery.of(context).size.width / 2,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              snapshot.data[0]['sensores']['temperature']
                                  .toString(),
                              style: const TextStyle(
                                fontSize: 70,
                                color: Colors.white,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                SizedBox(
                                  height: 30,
                                  child: Text(
                                    '°',
                                    style: TextStyle(
                                      fontSize: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  child: Text(
                                    'C',
                                    style: TextStyle(
                                      fontSize: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 3,
                              width: MediaQuery.of(context).size.width / 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Calidad del aire',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(124, 4, 53, 110)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${snapshot.data[0]['sensores']['air_quiality'].toStringAsFixed(0)}%',
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 4,
                              width: 10,
                              margin: const EdgeInsets.only(
                                  left: 20.0, right: 20.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
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
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 3,
                              width: MediaQuery.of(context).size.width / 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Humedad',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(124, 4, 53, 110)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${snapshot.data[0]['sensores']['humidity'].toString()}%',
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
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
