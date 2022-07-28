import 'package:flutter/material.dart';
import 'package:integradoraproyect/api/api.dart';
import 'package:integradoraproyect/widgets/spinner.dart';

class Exterior extends StatefulWidget {
  Exterior({Key? key, required this.datos}) : super(key: key);

  final datos;
  @override
  State<Exterior> createState() => _ExteriorState();
}

class _ExteriorState extends State<Exterior> {
  _imgLoader(double dat) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: FutureBuilder(
                  future: apiDatos(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      var da = double.parse(
                              snapshot.data['main']['temp'].toString()) -
                          273.15;
                      return Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 100,
                              width: double.infinity,
                              child: Center(
                                child: Text(
                                  snapshot.data['name'].toString(),
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 255, 203, 119),
                                    fontSize: 50,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 300,
                              child: Center(
                                child: Image.asset(_imgLoader(da).toString()),
                              ),
                            ),
                            SizedBox(
                              height: 100,
                              width: double.infinity,
                              child: Center(
                                child: Text(
                                  '${(double.parse(snapshot.data['main']['temp'].toString()) - 273.15).toStringAsFixed(0)}°C',
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 198, 73, 86),
                                    fontSize: 50,
                                  ),
                                ),
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
            ],
          ),
        ),
      ),
    );
  }
}
