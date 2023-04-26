import 'package:flutter/material.dart';
import 'package:projectapp/normalpages/profilepage.dart';
import 'package:projectapp/normalpages/shoplist.dart';

import '../model/bottom_navigation_bar.dart';
import 'startpage.dart';

class HomePage extends StatefulWidget {
  final int selectedIndex;

  const HomePage({super.key, this.selectedIndex = 0});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // use the passed argument or set default value
    _selectedIndex = widget.selectedIndex;
  }

  final _pages = [
    const StartPage(),
    const ShopList(),
    const ProfilePage(),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (arguments != null && arguments.containsKey('selectedIndex')) {
      _selectedIndex = arguments['selectedIndex'] as int;
    }
  }

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
      bottomNavigationBar: CustomBottomNavigationBar(
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
