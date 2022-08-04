import 'package:flutter/material.dart';
import 'package:integradoraproyect/constant/datosuser.dart';
import 'package:integradoraproyect/db/mongodb.dart';
import 'package:integradoraproyect/screens/register.dart';
import 'package:integradoraproyect/screens/session.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _usuario(BuildContext context) async {
    var dat =
        await MongoDatabase.logUsuario(_userController, _passwordController);
    if (dat != null) {
      DatosUsuario.ingresarDatos(_userController.text.toString());
      _userController.clear();
      _passwordController.clear();
      // ignore: use_build_context_synchronously
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => Session())));
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: SingleChildScrollView(
                child: ListBody(children: const [
                  Text('Usuario o contraseña invalido'),
                ]),
              ),
              actions: [
                TextButton(
                  onPressed: (() {
                    Navigator.of(context).pop();
                    _userController.clear();
                    _passwordController.clear();
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
          'Inicio',
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
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
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
                  cursorColor: const Color.fromARGB(255, 142, 108, 136),
                  style: TextStyle(
                      color: const Color.fromARGB(255, 142, 108, 136)
                          .withOpacity(0.9)),
                  decoration: InputDecoration(
                    labelText: 'Usuario',
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
                    labelText: 'Contraseña',
                    labelStyle: TextStyle(
                      color: const Color.fromARGB(255, 142, 108, 136)
                          .withOpacity(0.9),
                    ),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.white.withOpacity(0.3),
                    prefixIcon: const Icon(
                      Icons.key_outlined,
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
                      _usuario(context);
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.black26;
                          }
                          return const Color.fromARGB(255, 255, 203, 119);
                        }),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)))),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "No tienes una cuenta? ",
                      style: TextStyle(color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Register()));
                      },
                      child: const Text(
                        ' Registrarse',
                        style: TextStyle(
                            color: Color.fromARGB(255, 142, 108, 136),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
