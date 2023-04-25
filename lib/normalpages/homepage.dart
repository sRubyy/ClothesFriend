import 'package:flutter/material.dart';
import 'package:projectapp/normalpages/profilepage.dart';
import 'package:projectapp/normalpages/shoplist.dart';

import 'startpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final _pages = [
    const StartPage(),
    const ShopList(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconData(0xf013d, fontFamily: 'MaterialIcons')),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconData(0xf522, fontFamily: 'MaterialIcons')),
            label: 'Profile',
          ),
        ],
        backgroundColor: Colors.orange[300],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class MyBox extends StatelessWidget {
  final String img;
  final String text;

  const MyBox({super.key, required this.img, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(5)),
      width: 130,
      height: 100,
      child: Row(children: [
        Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          width: 35,
          height: 35,
          child: Image.asset(img),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
          child: Text(text),
        )
      ]),
    );
  }
}
