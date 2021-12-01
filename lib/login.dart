// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_pratica_3/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email = '';
  String _password = '';
  final bool _isFormValid = false;

  bool validateForm() {
    if (_email.isNotEmpty && _password.isNotEmpty) {
      return true;
    }

    return false;
  }

  void onEmailChanged(str) {
    setState(() {
      _email = str;
    });
  }

  void onPasswordChanged(str) {
    setState(() {
      _password = str;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[100],
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 24),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'E-mail',
                    ),
                    onChanged: (txt) {
                      onEmailChanged(txt);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Senha',
                    ),
                    onChanged: (txt) {
                      onPasswordChanged(txt);
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: validateForm()
                        ? () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (ctx) => Home()));
                          }
                        : null,
                    child: Text('Entrar'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
