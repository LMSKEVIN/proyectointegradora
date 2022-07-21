import 'package:flutter/material.dart';
import 'package:integradoraproyect/screens/login.dart';
import 'package:integradoraproyect/screens/session.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Login(),
    );
  }
}
