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
  var upcoming;
  var nowShowing;
  var i;
  Color mainColor = const Color(0xff3C3261);

  void getPopularData() async {
    var data = await getPopularJson();
    setState(() {
      movies = data['results'];
    });
  }

  void getUpComingData() async {
    var data = await getUpComingJson();
   
    setState(() {
      upcoming = data['results'];
    });
  }

  void getNowShowingData() async {
    var data = await getNowShowingJson();
   
    setState(() {
      nowShowing = data['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    getPopularData();
    getUpComingData();
    getNowShowingData();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.3,
        centerTitle: true,
        backgroundColor: Color(0xff242248),
       // backgroundColor: Colors.white,
        leading: Icon(
          Icons.menu,
          color: Color(0xff8267db),
        ),
        title: Text(
          'Movies',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Arvo',
              fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
           Icon(
            Icons.search,
            color: Color(0xff8267db),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          child:  Padding(
            padding: const EdgeInsets.all(16.0),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                 MovieTitle(mainColor,'Popular'),
                 Container(
                  height: 350,
                  child:  ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: movies == null ? 0 : movies.length,
                      itemBuilder: (context, i) {
                        return  Column(
                          children: <Widget>[
                             Container(
                              //empty space between images
                              width: 250,
                              height: 335,
                              // color: Colors.red,
                              child: Column(
                                children: <Widget>[
                                  FlatButton(
                                child:  MovieCell(movies, i),
                                padding: const EdgeInsets.all(0.0),
                                onPressed: () {
                                  // Navigator.push(context,
                                  //     new MaterialPageRoute(builder: (context) {
                                  //   return new MovieDetail(movies[i]);
                                  // }));
                                },
                                //color: Colors.white,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                                child: Text(movies[i]['title'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold
                                ),),
                              ),
                                ]
                              )
                            ),
                           
                          ],
                        );
                      }),
                ),
                 MovieTitle(mainColor,'Upcoming'),
                 Container(
                  height: 350,
                  child:  ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: upcoming == null ? 0 : movies.length,
                      itemBuilder: (context, i) {
                        return  Column(
                          children: <Widget>[
                             Container(
                              //empty space between images
                              width: 250,
                              height: 335,
                              // color: Colors.blue,
                              child: Column(
                                children: <Widget>[
                                  FlatButton(
                                child:  MovieCell(upcoming, i),
                                padding: const EdgeInsets.all(0.0),
                                onPressed: () {
                                  // Navigator.push(context,
                                  //     new MaterialPageRoute(builder: (context) {
                                  //   return new MovieDetail(movies[i]);
                                  // }));
                                },
                                //color: Colors.white,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                                child: Text(upcoming[i]['title'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold
                                ),),
                              ),
                                ]
                              ),
                            ),
                          ],
                        );
                      }),
                ),
                 MovieTitle(mainColor,'Now Playing'),
                 Container(
                  height: 350,
                  child:  ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: movies == null ? 0 : movies.length,
                      itemBuilder: (context, i) {
                        return  Column(
                          children: <Widget>[
                             Container(
                              //empty space between images
                              width: 250,
                              height: 335,
                              // color: Colors.greenAccent,
                              child: Column(
                                children: <Widget>[
                                  FlatButton(
                                child:  MovieCell(nowShowing, i),
                                padding: const EdgeInsets.all(0.0),
                                onPressed: () {
                                  // Navigator.push(context,
                                  //     new MaterialPageRoute(builder: (context) {
                                  //   return new MovieDetail(movies[i]);
                                  // }));
                                },
                                //color: Colors.white,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                                child: Text(nowShowing[i]['title'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold
                                ),),
                              ),
                                ]
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

Future<Map> getPopularJson() async {
  var apiKey = '6a53377c0ee23811945a9e71a993601f';
  var url = 'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=en-US&page=1';
  var response = await http.get(url);
  return json.decode(response.body);
}

Future<Map> getUpComingJson() async{
  var apiKey = '6a53377c0ee23811945a9e71a993601f';
  var url = 'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey&language=en-US&page=1';
  var response = await http.get(url);
  return json.decode(response.body);
}

Future<Map> getNowShowingJson() async{
  var apiKey = '6a53377c0ee23811945a9e71a993601f';
  var url = 'https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey&language=en-US&page=1';
  var response = await http.get(url);
  return json.decode(response.body);
}


class MovieTitle extends StatelessWidget {
  final Color mainColor;
  final title;

  MovieTitle(this.mainColor, this.title);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      child:  Text(
        title,
        style:  TextStyle(
            fontSize: 25.0,
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
  final Color mainColor = const Color(0xff3C3261);
  final imageUrl = 'https://image.tmdb.org/t/p/w500/';
  MovieCell(this.movies, this.i);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: <Widget>[
         Row(
          children: <Widget>[
             Padding(
              padding: const EdgeInsets.all(0.0),
              child:  Container(
                margin: const EdgeInsets.all(16.0),
                child:  Container(
                  //image container size
                  width: 200.0,
                  height: 200.0,
                ),
                decoration:  BoxDecoration(
                  borderRadius:  BorderRadius.circular(10.0),
                  color: Colors.grey,
                  image:  DecorationImage(
                      image:  NetworkImage(
                          imageUrl + movies[i]['poster_path']),
                      fit: BoxFit.cover),
                  boxShadow: [
                     BoxShadow(
                        color: mainColor,
                        blurRadius: 5.0,
                        offset:  Offset(2.0, 5.0))
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
