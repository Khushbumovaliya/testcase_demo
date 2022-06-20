import 'package:flutter/material.dart';
import 'package:flutter_mock_test_demo/screens/FifthScreen.dart';

class FourthScreen extends StatefulWidget {
  @override
  _FourthScreenState createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Integration test'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              key: Key('textField'),
              controller: controller,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (controller.text.isNotEmpty) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (buildContext) =>
                        FifthScreen(text: controller.text))).then((value) {
              controller.text = '';
            });
          }
        },
        child: RotatedBox(
            quarterTurns: 2, child: const Icon(Icons.arrow_back_sharp)),
      ),
    );
  }
}
