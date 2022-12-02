import 'package:flutter/material.dart';
import 'package:osj_flutter/first_page.dart';
import 'package:osj_flutter/second_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  final List<Widget> pages = [FirstPage(), SecondPage()];

  void IndexChange(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.looks_one),label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.looks_two), label: ''),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.lightBlue,
          onTap: IndexChange,
          type: BottomNavigationBarType.fixed,
        ));
  }
}
