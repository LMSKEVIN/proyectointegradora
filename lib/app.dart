import 'package:flutter/material.dart';
import 'package:integradoraproyect/screens/inicio.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Inicio(),
    );
  }
}
