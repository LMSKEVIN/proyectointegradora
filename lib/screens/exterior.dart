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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width:  double.infinity,
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
        child: Column(
          children: [
            Container(
              child: SingleChildScrollView(
                child: Container(
                      height: MediaQuery.of(context).size.height /3,
                      width: MediaQuery.of(context).size.width*0.90,
                      child: Center(
                        child: FutureBuilder(
                        future: apiDatos(),
                        builder: (context, AsyncSnapshot snapshot){
                          if(snapshot.hasData){
                            var dat = double.parse(snapshot.data['main']['temp'].toString()) - 273.15;
                            return Container(
                              width: double.infinity,
                              height: double.infinity,
                            );
                          }else{
                            return Center(child: spinner(context),);
                          }
                        },
                      ),
                      ),
                    ),
              ),
            )
          ],
        ),
      )
    );
  }
}

/*
Container(
        height: 200,
        width: 200,
        child: Card(),
      )
*/