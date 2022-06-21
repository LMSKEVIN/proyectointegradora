import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController nameCotroller = TextEditingController();
  TextEditingController passwordCOntroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: 100,
            height: 200,
            child: Image.asset('assets/dibujo.png'),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            width: 200,
            height: 200,
            child: const Text(
              "Sign in",
              style: TextStyle(
                  color: Color.fromRGBO(23, 195, 178, 1),
                  fontWeight: FontWeight.w500,
                  fontSize: 30),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: nameCotroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "User name",
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              obscureText: true,
              controller: passwordCOntroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              //forgot password screen
            },
            child: const Text("Forgot Password"),
          ),
          Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text("Login"),
                onPressed: () {
                  print(nameCotroller.text);
                  print(passwordCOntroller.text);
                },
              )),
          Row(
            children: <Widget>[
              const Text("Does not have account?"),
              TextButton(
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  //signup screen
                },
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ],
      ),
    );
  }
}
