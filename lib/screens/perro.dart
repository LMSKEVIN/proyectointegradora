import 'package:flutter/material.dart';

Container cartaDatos() {
  return Container(
      height: 190,
      width: 500,
      margin: const EdgeInsets.only(left: 46.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 170, 68, 101),
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
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                Text(
                  'Hola mundo',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                Text(
                  'Hola mundo Hola mundo Hola mundo Hola mundo Hola mundo',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            )
          ],
        ),
      ));
}
