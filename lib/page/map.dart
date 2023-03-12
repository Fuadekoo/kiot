import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class map extends StatefulWidget {
  const map({super.key});

  @override
  State<map> createState() => _mapState();
}

class _mapState extends State<map> {
  List<String> data = ['Item 1', 'Item 2', 'Item 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 240, 149, 149),
          brightness: Brightness.light,
          elevation: 0,
          title: Center(
            child: Text(
              'Wollo University(KIOT)',
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Column(
                children: <Widget>[
                  Text(
                    'name',
                    style: TextStyle(),
                  ),
                  Text('block'),
                  Text('dorm'),
                ],
              ),
            );
          },
          itemCount: 50,
        ));
  }
}
