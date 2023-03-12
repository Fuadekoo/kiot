import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kiotcampas/page/about.dart';
import 'package:kiotcampas/page/contacts.dart';
import 'package:kiotcampas/page/department.dart';
import 'package:kiotcampas/page/facility.dart';
import 'package:kiotcampas/page/map.dart';
import 'package:kiotcampas/page/setting.dart';
import 'package:line_icons/line_icons.dart';
import 'package:http/http.dart';

void main() => runApp(const MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var pad = EdgeInsets.symmetric(
    horizontal: 18,
    vertical: 5,
  );
  int _selected = 1;
  int _selectedIndex = 0;
  List<Student> _students = [];
  static List<Widget> _widgetOptions = [
    //home
    Container(
      color: Colors.red,
      child: Center(
        child: Text(
          "home",
        ),
      ),
    ),
    //home2
    Container(
      color: Color.fromARGB(255, 201, 221, 17),
      child: Center(
        child: Text(
          "department",
        ),
      ),
    ),
    //home3
    Container(
      color: Color.fromARGB(255, 14, 204, 24),
      child: Center(
        child: Text(
          "facility",
        ),
      ),
    ),
    //home4
    Container(
      color: Color.fromARGB(255, 17, 83, 206),
      child: Center(
        child: Text(
          "map",
        ),
      ),
    ),
  ];
  void changeSelected(int index) {
    setState(() {
      _selected = index;
    });
  }

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
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30))),
            padding: EdgeInsets.all(20.0),
            child: Column(children: <Widget>[
              Text(
                'find your ',
                style: TextStyle(color: Colors.black87, fontSize: 25),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Profile information',
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(240, 240, 237, 1),
                    borderRadius: BorderRadius.circular(15)),
                child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search, color: Colors.black87),
                        hintText: "searching using your admission number",
                        hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 15))),
              ),
              // ListView.builder(
              //   itemBuilder: (context, index) {
              //     return Card(
              //       child: Column(
              //         children: <Widget>[
              //           Text('name'),
              //           Text('block'),
              //           Text('dorm'),
              //         ],
              //       ),
              //     );
              //   },
              //   itemCount: 50,
              // )
            ]),
          ),
          Expanded(
            child: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          ),
        ],
      )),
      drawer: Drawer(
        width: 360,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/kiot.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: const [
                  Text(
                    'KIOT',
                    style: TextStyle(fontSize: 30, color: Colors.green),
                  ),
                ],
              ),
            ),
            ListTile(
              selected: _selected == 0,
              leading: const Icon(
                Icons.settings,
                size: 28,
              ),
              title: const Text(
                'settings',
                style: TextStyle(
                  fontSize: 23,
                ),
              ),
              onTap: () {
                changeSelected(0);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Setting(),
                ));
              },
            ),
            ListTile(
              selected: _selected == 1,
              leading: const Icon(
                Icons.info,
                size: 28,
              ),
              title: const Text(
                'About',
                style: TextStyle(
                  fontSize: 23,
                ),
              ),
              onTap: () {
                changeSelected(1);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const About(),
                ));
              },
            ),
            ListTile(
              selected: _selected == 2,
              leading: const Icon(
                Icons.contacts,
                size: 28,
              ),
              title: const Text(
                'contacts',
                style: TextStyle(
                  fontSize: 23,
                ),
              ),
              onTap: () {
                changeSelected(2);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Contacts(),
                ));
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
          child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            boxShadow: [
              BoxShadow(
                spreadRadius: -10,
                blurRadius: 60,
                color: Colors.black.withOpacity(0.4),
                offset: const Offset(0, 25),
              )
            ]),
        child: GNav(
          curve: Curves.fastOutSlowIn,
          duration: const Duration(milliseconds: 900),
          tabs: [
            GButton(
              gap: 10,
              icon: LineIcons.home,
              iconColor: Colors.black,
              iconActiveColor: Colors.purple,
              text: 'home',
              textColor: Colors.purple,
              backgroundColor: Colors.purple.withOpacity(0.2),
              iconSize: 24,
              padding: pad,
            ),
            GButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const department();
                }));
              },
              gap: 10,
              icon: LineIcons.graduationCap,
              iconColor: Colors.black,
              iconActiveColor: Colors.purple,
              text: 'department',
              textColor: Colors.purple,
              backgroundColor: Colors.purple.withOpacity(0.2),
              iconSize: 24,
              padding: pad,
            ),
            GButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const facility();
                }));
              },
              gap: 10,
              icon: LineIcons.globe,
              iconColor: Colors.black,
              iconActiveColor: Colors.purple,
              text: 'facility',
              textColor: Colors.purple,
              backgroundColor: Colors.purple.withOpacity(0.2),
              iconSize: 24,
              padding: pad,
            ),
            GButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const map();
                }));
              },
              gap: 10,
              icon: LineIcons.map,
              iconColor: Colors.black,
              iconActiveColor: Colors.purple,
              text: 'map',
              textColor: Colors.purple,
              backgroundColor: Colors.purple.withOpacity(0.2),
              iconSize: 24,
              padding: pad,
            ),
          ],
          // selectedIndex: _selectedIndex,
          // onTabChange: (index) {
          //   setState(() {
          //     _selectedIndex = index;
          //   });
          // },
        ),
      )),
    );
  }
}

class Student {
  final String name;
  final String block;
  final String dorm;

  Student({required this.name, required this.block, required this.dorm});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      name: json['name'],
      block: json['block'],
      dorm: json['dorm'],
    );
  }
}
