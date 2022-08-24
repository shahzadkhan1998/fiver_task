import 'package:flutter/material.dart';
import '../Screens/Home_Screen/View/download.dart';
import '../Screens/Home_Screen/View/home.dart';
import '../Screens/Home_Screen/View/profile.dart';




class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {


  int _currentIndex = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: item,
          onTap: (value)
          {
            setState(() {
              _currentIndex = value;
            });
          },
        )
    );
  }
}
List<Widget> pages = [
  HomeScreen(),
  Dwonload(),
  Profile()



];
List<BottomNavigationBarItem> item = [
  const BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
  const BottomNavigationBarItem(icon: Icon(Icons.download),label: "Download"),
  const BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Profile"),

];


