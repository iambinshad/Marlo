import 'package:flutter/material.dart';
import 'package:marlo_technologies/view/sub/bottom_nav_screen/home/home.dart';
import 'package:marlo_technologies/view/sub/bottom_nav_screen/screen_five.dart';
import 'package:marlo_technologies/view/sub/bottom_nav_screen/screen_four.dart';
import 'package:marlo_technologies/view/sub/bottom_nav_screen/screen_three.dart';
import 'package:marlo_technologies/view/sub/bottom_nav_screen/screen_two.dart';

class BottomNav extends StatefulWidget {
  BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List<Widget> screen = [
     HomeScreen(),
    const ViewAllTransactions(),
    const Screenthree(),
    const ScreenFour(),
    const ScreenFive(),
  ];


  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screen[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0.0,
          unselectedLabelStyle:const TextStyle(color: Colors.grey),
            currentIndex: currentIndex,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: const TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold),
            onTap: (value) {
              currentIndex = value;
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_sharp), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.attach_money_outlined), label: 'Loans'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.edit_document), label: 'Contracts'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people_outline), label: 'Teams'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble_outline), label: 'Chat'),
            ]));
  }
}
