import 'package:flutter/material.dart';

Container datosUser(var user){
  return Container(
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
    child: Center(
      child: Column(
        children: [
          Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),),
        ],
      ),
    ),
  );
}