import 'package:flutter/material.dart';

class Interior extends StatefulWidget {
  Interior({Key? key}) : super(key: key);

  @override
  State<Interior> createState() => _InteriorState();
}

class _InteriorState extends State<Interior> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(height: double.infinity,
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
          child: SizedBox(child: SingleChildScrollView(
            
          ),),
          ),
        ),
    );
  }
}