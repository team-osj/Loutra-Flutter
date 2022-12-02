import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osj_flutter/first_page.dart';
import 'package:osj_flutter/second_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  final List<Widget> pages = [const FirstPage(), const SecondPage()];

  void indexChange(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(3.0.r),
        child: pages[selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.looks_one), label: '세탁실 1'),
          BottomNavigationBarItem(icon: Icon(Icons.looks_two), label: '세탁실 2'),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.black,
        onTap: indexChange,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
