import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Listview scroll test'),
        ),
        body: listWidget(),
      );

  }
}

listWidget() {
  return ListView.builder(
    key: const Key('long_list'),
    itemCount: 100,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(index.toString()),
        key: Key('item_${index}_text'),
      );
    },
  );
}
