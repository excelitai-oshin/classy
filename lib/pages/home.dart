import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
          children: [
            Text(
              'welcome ', style: TextStyle(color: Colors.black, fontSize: 30),),
          ]
      ),

    );
  }
}

