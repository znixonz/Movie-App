import 'package:flutter/material.dart';
import 'package:movie_app/Screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData(
          primarySwatch: Colors.blue, canvasColor: Colors.transparent),
      home: MyHomePage(),
    );
  }
}
