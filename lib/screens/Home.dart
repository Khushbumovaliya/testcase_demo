import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_mock_test_demo/Modal/Album.dart';
import 'package:flutter_mock_test_demo/screens/FourthScreen.dart';
import 'package:flutter_mock_test_demo/screens/SecondScreen.dart';
import 'package:flutter_mock_test_demo/screens/ThirdScreen.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  String title;
  String message;

  Home({
    Key? key,
    required this.title,
    required this.message,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: Key('K'),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Builder(
          builder: (buildContext) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Center(child: Text(widget.message)),
              SizedBox(height: 20,),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        buildContext,
                        MaterialPageRoute(
                            builder: (buildContext) => SecondScreen()));
                  },
                  child: Text('Next screen')),
              SizedBox(height: 20,),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        buildContext,
                        MaterialPageRoute(
                            builder: (buildContext) => ThirdScreen()));
                  },
                  child: Text('Next screen')),
              SizedBox(height: 20,),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        buildContext,
                        MaterialPageRoute(
                            builder: (buildContext) => FourthScreen()));
                  },
                  child: Text('Next screen')),

            ],
          ),
        ),
      );

  }
}

Future<Album> fetchAlbum(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}
