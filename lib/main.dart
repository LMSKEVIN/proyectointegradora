import 'package:flutter/material.dart';
import 'package:integradoraproyect/app.dart';
import 'package:integradoraproyect/db/mongodb.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDB.conectar();
  runApp(const App());
}
