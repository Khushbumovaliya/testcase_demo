import 'package:flutter/material.dart';
import 'package:flutter_mock_test_demo/screens/Home.dart';

void main() {
  runApp(MaterialApp(
      home: Home(
          title: 'Widget testing',
          message: 'Test widget using flutter test package')));
}
