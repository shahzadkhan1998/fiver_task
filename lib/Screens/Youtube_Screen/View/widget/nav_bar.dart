import 'package:fiver_task/Screens/Youtube_Screen/View/browser_page.dart';
import 'package:fiver_task/Screens/Youtube_Screen/View/paste_link.dart';
import 'package:flutter/material.dart';

class NavYoutube extends StatefulWidget {
  const NavYoutube({Key? key}) : super(key: key);

  @override
  State<NavYoutube> createState() => _NavYoutubeState();
}

class _NavYoutubeState extends State<NavYoutube> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: item,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
        ));
  }
}

List<Widget> pages = [
  const Paste_link(),
  const Browser_Page(),
];
List<BottomNavigationBarItem> item = [
  const BottomNavigationBarItem(
      icon: Icon(Icons.paste), label: "Paste Link Here"),
  const BottomNavigationBarItem(
      icon: Icon(Icons.browser_updated_outlined), label: "Browser"),
];
