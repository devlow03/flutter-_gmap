import 'package:flutter/material.dart';
import 'package:newapp/src/resources/HomeScreen.dart';
import 'src/resources/Login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User App',
      theme: ThemeData(
        primaryColor: Colors.greenAccent,
      ),
     home:MapScreen(),
    );
  }
}