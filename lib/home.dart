import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Title(
          color: Colors.white,
          child: Text("Movies"),
        ),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              color: Colors.purpleAccent,
              onPressed: (null))
        ],
      ),
      body: Container(
        color: Colors.purple[900],
        child: ListView(
          //animation
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Container(
              child: Text("Discover Movies"),
              color: Colors.redAccent,
            ),
            Container(
              child: Text("Top Rated"),
              color: Colors.orangeAccent,
            ),
            Container(
              child: Text("Now Playing"),
              color: Colors.yellowAccent,
            ),
            Container(
              child: Text("Popular"),
              color: Colors.greenAccent,
            )
          ],
        ),
      ),
    );
  }
}
