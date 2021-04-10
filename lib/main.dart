import 'package:flutter/material.dart';
import 'package:scratchwin/homepage.dart';

void main() {
  runApp(MaterialApp(
    title: 'Screatch and Win',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.pink,
    ),
    home: HomePage(),
  ));
}
