import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class department extends StatefulWidget {
  const department({super.key});

  @override
  State<department> createState() => _departmentState();
}

class _departmentState extends State<department> {
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
      body: Center(
        child: Text('department'),
      ),
    );
  }
}
