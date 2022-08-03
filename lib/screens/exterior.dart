import 'package:flutter/material.dart';
import 'package:integradoraproyect/api/api.dart';
import 'package:integradoraproyect/db/mongodb.dart';
import 'package:integradoraproyect/widgets/datos.dart';
import 'package:integradoraproyect/widgets/spinner.dart';

class Exterior extends StatefulWidget {
  Exterior({
    Key? key,
  }) : super(key: key);

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
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder(
              future: apiDatos(),
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
                            snapshot.data['name'].toString(),
                            style: const TextStyle(
                                fontSize: 50, color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Image(
                          image: AssetImage(_imgLoader(double.parse(
                              snapshot.data['main']['temp'].toString()))),
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
                              _limDatos(double.parse(
                                      snapshot.data['main']['temp'].toString()))
                                  .toStringAsFixed(0),
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
                                    'Temperatura máxima',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(124, 4, 53, 110)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${_limDatos(double.parse(snapshot.data['main']['temp_max'].toString())).toStringAsFixed(0)}°C     ',
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Sensación térmica',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(124, 4, 53, 110)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${_limDatos(double.parse(snapshot.data['main']['feels_like'].toString())).toStringAsFixed(0)}°C     ',
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.black),
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
                                    'Temperatura mínima',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(124, 4, 53, 110)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${_limDatos(double.parse(snapshot.data['main']['temp_min'].toString())).toStringAsFixed(0)}°C',
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
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
                                    '${(double.parse(snapshot.data['main']['humidity'].toString())).toStringAsFixed(0)}%',
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.black),
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
