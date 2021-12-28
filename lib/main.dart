import 'package:classy/setup/registation.dart';
import 'package:classy/setup/signin.dart';
import 'package:flutter/material.dart';

void main() async{

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Colors.white70
      ),
      home: SignIn(),
    );
  }
}

