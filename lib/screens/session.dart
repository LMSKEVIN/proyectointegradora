import 'package:flutter/material.dart';
import 'package:integradoraproyect/screens/interior.dart';
import 'package:integradoraproyect/screens/pruebas.dart';
import 'package:integradoraproyect/screens/exterior.dart';

class Session extends StatefulWidget {
  final user;
  const Session({Key? key, required this.user}) : super(key: key);

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
    Exterior(datos: user),
    Interior(),
    const SizedBox(
      width: double.infinity,
      child: Center(
        child: Text('!'),
      ),
    ),
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
            icon: Icon(Icons.person),
            label: 'Configuracion',
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
