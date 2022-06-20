import 'package:flutter/material.dart';

class FifthScreen extends StatefulWidget {
  String? text;

  FifthScreen({Key? key, @required this.text}) : super(key: key);

  @override
  _FifthScreenState createState() => _FifthScreenState();
}

class _FifthScreenState extends State<FifthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Integration test'),
      ),
      body: Text(widget.text ?? ''),
    );
  }
}
