import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var movies;
  Color mainColor = const Color(0xff3C3261);

  void getData() async {
    var data = await getJson();

    setState(() {
      movies = data['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();

    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        elevation: 0.3,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: new Icon(
          Icons.menu,
          color: mainColor,
        ),
        title: new Text(
          'Movies',
          style: new TextStyle(
              color: mainColor,
              fontFamily: 'Arvo',
              fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          new Icon(
            Icons.search,
            color: mainColor,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.brown,
          child: new Padding(
            padding: const EdgeInsets.all(16.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new MovieTitle(mainColor),
                new Container(
                  height: 250,
                  child: new ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: movies == null ? 0 : movies.length,
                      itemBuilder: (context, i) {
                        return new Column(
                          children: <Widget>[
                            new Container(
                              //empty space between images
                              width: 250,
                              height: 240,
                              color: Colors.red,
                              child: new FlatButton(
                                child: new MovieCell(movies, i),
                                padding: const EdgeInsets.all(0.0),
                                onPressed: () {
                                  // Navigator.push(context,
                                  //     new MaterialPageRoute(builder: (context) {
                                  //   return new MovieDetail(movies[i]);
                                  // }));
                                },
                                //color: Colors.white,
                              ),
                            ),
                          ],
                        );
                      }),
                ),
                new MovieTitle(mainColor),
                new Container(
                  height: 250,
                  child: new ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: movies == null ? 0 : movies.length,
                      itemBuilder: (context, i) {
                        return new Column(
                          children: <Widget>[
                            new Container(
                              //empty space between images
                              width: 250,
                              height: 240,
                              color: Colors.blue,
                              child: new FlatButton(
                                child: new MovieCell(movies, i),
                                padding: const EdgeInsets.all(0.0),
                                onPressed: () {
                                  // Navigator.push(context,
                                  //     new MaterialPageRoute(builder: (context) {
                                  //   return new MovieDetail(movies[i]);
                                  // }));
                                },
                                //color: Colors.white,
                              ),
                            ),
                          ],
                        );
                      }),
                ),
                new MovieTitle(mainColor),
                new Container(
                  height: 250,
                  child: new ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: movies == null ? 0 : movies.length,
                      itemBuilder: (context, i) {
                        return new Column(
                          children: <Widget>[
                            new Container(
                              //empty space between images
                              width: 250,
                              height: 240,
                              color: Colors.greenAccent,
                              child: new FlatButton(
                                child: new MovieCell(movies, i),
                                padding: const EdgeInsets.all(0.0),
                                onPressed: () {
                                  // Navigator.push(context,
                                  //     new MaterialPageRoute(builder: (context) {
                                  //   return new MovieDetail(movies[i]);
                                  // }));
                                },
                                //color: Colors.white,
                              ),
                            ),
                          ],
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<Map> getJson() async {
  var apiKey = '6a53377c0ee23811945a9e71a993601f';
  var url = 'http://api.themoviedb.org/3/discover/movie?api_key=${apiKey}';
  var response = await http.get(url);
  return json.decode(response.body);
}

class MovieTitle extends StatelessWidget {
  final Color mainColor;

  MovieTitle(this.mainColor);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      child: new Text(
        'Top Rated',
        style: new TextStyle(
            fontSize: 20.0,
            color: mainColor,
            fontWeight: FontWeight.bold,
            fontFamily: 'Arvo'),
        textAlign: TextAlign.left,
      ),
    );
  }
}

class MovieCell extends StatelessWidget {
  final movies;
  final i;
  Color mainColor = const Color(0xff3C3261);
  var image_url = 'https://image.tmdb.org/t/p/w500/';
  MovieCell(this.movies, this.i);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Row(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(0.0),
              child: new Container(
                margin: const EdgeInsets.all(16.0),
//                                child: new Image.network(image_url+movies[i]['poster_path'],width: 100.0,height: 100.0),
                child: new Container(
                  //image container size
                  width: 200.0,
                  height: 200.0,
                ),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(10.0),
                  color: Colors.grey,
                  image: new DecorationImage(
                      image: new NetworkImage(
                          image_url + movies[i]['poster_path']),
                      fit: BoxFit.cover),
                  boxShadow: [
                    new BoxShadow(
                        color: mainColor,
                        blurRadius: 5.0,
                        offset: new Offset(2.0, 5.0))
                  ],
                ),
              ),
            ),
            // new Expanded(
            //     child: new Container(
            //   color: Colors.blue,
            //   margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
            //   child: new Column(
            //     children: [
            //       // new Text(
            //       //   movies[i]['title'],
            //       //   style: new TextStyle(
            //       //       fontSize: 20.0,
            //       //       fontFamily: 'Arvo',
            //       //       fontWeight: FontWeight.bold,
            //       //       color: mainColor),
            //       // ),
            //       new Padding(padding: const EdgeInsets.all(2.0)),
            //       // new Text(
            //       //   movies[i]['overview'],
            //       //   maxLines: 1,
            //       //   style: new TextStyle(
            //       //       color: const Color(0xff8785A4), fontFamily: 'Arvo'),
            //       // )
            //     ],
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //   ),
            // )),
          ],
        ),
        // new Container(
        //   width: 100.0,
        //   height: 0.5,

        //   //color: const Color(0xD2D2E1ff),
        //   color: Colors.blue,
        //   margin: const EdgeInsets.all(16.0),
        // )
      ],
    );
  }
}
