import 'package:flutter/material.dart';


class DrawerExample extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(child: Text('Drawer Header'),
        decoration:
        BoxDecoration(color: Colors.greenAccent),)
      ],)
    );
  }
}