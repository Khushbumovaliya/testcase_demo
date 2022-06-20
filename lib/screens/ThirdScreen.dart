import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final controller = TextEditingController();
  var data_list = [];

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tap,drag,enter text widget test'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: data_list.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: Key('${data_list[index]}${index}'),
                  onDismissed: (direction) {
                    setState(() {
                      data_list.removeAt(index);
                    });
                  },
                  child: ListTile(title: Text(data_list[index])),
                  background: Container(color: Colors.red),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(controller.text.isNotEmpty)
            {
              setState(() {
                data_list.add(controller.text);
                controller.clear();
              });
            }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
