import 'package:flutter/material.dart';
import 'package:integradoraproyect/api/api.dart';
import 'package:integradoraproyect/widgets/spinner.dart';
import 'package:google_fonts/google_fonts.dart';

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
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width,
                child: FutureBuilder(
                  future: apiDatos(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      var da = double.parse(
                              snapshot.data['main']['temp'].toString()) -
                          273.15;
                      return Container(
                        height: 120.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 24.0),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: 124,
                              margin: const EdgeInsets.only(left: 46.0),
                              decoration: BoxDecoration(
                                color: Colors.white70,
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
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 5.0),
                              alignment: FractionalOffset.centerLeft,
                              child: Image(
                                image: AssetImage(_imgLoader(da)),
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
            ],
          ),
        ),
      ),
    );
  }
}

/*

*/
