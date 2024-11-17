import 'package:coffee_ui/pages/fav_page.dart';
import 'package:coffee_ui/pages/home_page.dart';
import 'package:coffee_ui/pages/notify_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _selectedIndex = 0;

  void _navigateBottomNavBar(int i) {
    setState(() {
      _selectedIndex = i;
    });
  }

  final List<Widget> _children = [
    HomePage(),
    FavPage(),
    NotifyPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomNavBar,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: " "),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: " "),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: " ")
      ]),
    );
  }
}
