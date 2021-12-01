import 'package:flutter/material.dart';
import 'package:flutter_pratica_3/home.dart';
import 'package:flutter_pratica_3/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atividade 3',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Login(),
    );
  }
}
