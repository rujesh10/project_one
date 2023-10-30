import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project_one/screens/home_screen.dart';
import 'package:project_one/screens/profile_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedTab = 0;
  List pages = [HomeScreen(), ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedTab],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedTab,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          onTap: (index) {
            setState(() {
              selectedTab = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ]),
    );
  }
}
