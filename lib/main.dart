import 'package:flutter/material.dart';
import 'package:food_app/screens/home_page.dart';
import 'package:food_app/screens/login.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Food App',
    theme: ThemeData(
      primarySwatch: Colors.red,
    ),
    home: new LoginScreen(),
  ));
}
