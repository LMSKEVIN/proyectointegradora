import 'package:flutter/material.dart';
import 'package:integradoraproyect/screens/login.dart';
import 'package:integradoraproyect/db/mongodb.dart';
import 'package:integradoraproyect/model/user.dart';
import 'package:sm_crypto/sm_crypto.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String encrypt = '';
  void encryptMet(TextEditingController pass){
    setState(() {
      encrypt = SM3.encryptString(pass.text);
    });
  }
  void _registro() async{
    if (_userController.text.toString() != '' &&
        _emailController.text.toString() != '' &&
        _passwordController.toString() != '') {
      encryptMet(_passwordController);
      Usuario newuser = Usuario(
          user: _userController.text,
          email: _emailController.text,
          password: encrypt);
          if(await MongoDatabase.insertaruser(newuser, _userController.text)){
            Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      );
          }else{
            showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: SingleChildScrollView(
                child: ListBody(children: const [
                  Text('El usuario ya esta en uso'),
                ]),
              ),
              actions: [
                TextButton(
                  onPressed: (() {
                    Navigator.of(context).pop();
                    _userController.clear();
                    _passwordController.clear();
                    _emailController.clear();
                  }),
                  child: const Text('Acceptar'),
                )
              ],
            );
          });
          }
      _userController.clear();
      _emailController.clear();
      _passwordController.clear();
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: SingleChildScrollView(
                child: ListBody(children: const [
                  Text('No se rellenaron todos los campos'),
                ]),
              ),
              actions: [
                TextButton(
                  onPressed: (() {
                    Navigator.of(context).pop();
                    _userController.clear();
                    _passwordController.clear();
                    _emailController.clear();
                  }),
                  child: const Text('Acceptar'),
                )
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Registro',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
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
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/dibujo.png',
                ),
                const SizedBox(
                  height: 100.0,
                ),
                TextField(
                  controller: _userController,
                  cursorColor:
                      const Color.fromARGB(255, 142, 108, 136).withOpacity(0.9),
                  style: TextStyle(
                      color: const Color.fromARGB(255, 142, 108, 136)
                          .withOpacity(0.9)),
                  decoration: InputDecoration(
                    labelText: 'User name',
                    labelStyle: TextStyle(
                      color: const Color.fromARGB(255, 142, 108, 136)
                          .withOpacity(0.9),
                    ),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.white.withOpacity(0.3),
                    prefixIcon: const Icon(
                      Icons.person_outline_outlined,
                      color: Color.fromARGB(255, 142, 108, 136),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: _emailController,
                  cursorColor:
                      const Color.fromARGB(255, 142, 108, 136).withOpacity(0.9),
                  style: TextStyle(
                      color: const Color.fromARGB(255, 142, 108, 136)
                          .withOpacity(0.9)),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: const Color.fromARGB(255, 142, 108, 136)
                          .withOpacity(0.9),
                    ),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.white.withOpacity(0.3),
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: Color.fromARGB(255, 142, 108, 136),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  obscureText: true,
                  controller: _passwordController,
                  cursorColor:
                      const Color.fromARGB(255, 142, 108, 136).withOpacity(0.9),
                  style: TextStyle(
                      color: const Color.fromARGB(255, 142, 108, 136)
                          .withOpacity(0.9)),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: const Color.fromARGB(255, 142, 108, 136)
                          .withOpacity(0.9),
                    ),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.white.withOpacity(0.3),
                    prefixIcon: const Icon(
                      Icons.password_outlined,
                      color: Color.fromARGB(255, 142, 108, 136),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(90)),
                  child: ElevatedButton(
                    onPressed: () {
                      _registro();
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.black26;
                        }
                        return const Color.fromARGB(255, 255, 203, 119);
                      }),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Registrarse',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
