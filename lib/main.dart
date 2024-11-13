import 'package:flutter/material.dart';

import 'Home.dart';

void main() => runApp(Dicee());

class Dicee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          //useMaterial3: true,
          ),
      debugShowCheckedModeBanner: false,
      title: 'Dice App',
      home: Home(),
    );
  }
}


