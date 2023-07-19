import 'package:flutter/material.dart';

import 'package:project_uas/cartpage/cartpage_screen.dart';
import 'package:project_uas/favoritepage/favorit.dart';
import 'package:project_uas/menupage/menupage_screen.dart';
import 'package:project_uas/profilepage/profilepage_screen.dart';

class Floating extends StatefulWidget {
  const Floating({super.key});

  @override
  State<Floating> createState() => _FloatingState();
}

class _FloatingState extends State<Floating> {
  int _currentIndex = 0;

  void changeTab(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final _screen = <Widget>[
      const MenuPageScreen(),
      const Favorit_Screen(),
      const CartPageScreen(),
      const ProfilePageScreen()
    ];
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screen),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => changeTab(index),
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.black,
          backgroundColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 27,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favorites"),
            BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ]),
    );
  }
}
