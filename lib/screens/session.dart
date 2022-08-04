import 'package:flutter/material.dart';
import 'package:integradoraproyect/constant/datosuser.dart';
import 'package:integradoraproyect/screens/interior.dart';
import 'package:integradoraproyect/screens/notas.dart';
import 'package:integradoraproyect/screens/pruebas.dart';
import 'package:integradoraproyect/screens/exterior.dart';

class Session extends StatefulWidget {
  const Session({
    Key? key,
  }) : super(key: key);

  @override
  State<Session> createState() => _SessionState();
}

class _SessionState extends State<Session> {
  int _selectedIndex = 0;
  final datos = user;
  void _onIteamTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _widgetOption = <Widget>[
    Interior(),
    Exterior(),
    Notas(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOption.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Casa',
            backgroundColor: Color.fromARGB(255, 135, 191, 255),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sunny),
            label: 'Exterior',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: 'Notas',
            backgroundColor: Colors.purple,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 255, 203, 119),
        onTap: _onIteamTapped,
      ),
    );
  }
}
