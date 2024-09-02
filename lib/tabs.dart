import 'package:calendar_ui/presentation/screens/fourth_screen.dart';
import 'package:calendar_ui/presentation/screens/home_screen.dart';
import 'package:calendar_ui/presentation/screens/profile_screen.dart';
import 'package:calendar_ui/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    ProfileScreen(),
    ThirdScreen(),
    FourthScreen(),
  ];

  void _togglePages(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
        child: _pages[selectedIndex],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return ClipRRect(
      child: Container(
        margin: const EdgeInsets.fromLTRB(45, 0, 45, 30),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (newIndex) {
                _togglePages(newIndex);
              },
              items: const [
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.person),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.book),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.question_mark),
            ),
          ]),
        ),
      ),
    );
  }
}
