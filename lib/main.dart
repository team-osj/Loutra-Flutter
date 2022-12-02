import 'package:flutter/material.dart';
import 'package:osj_flutter/main_page.dart';
import 'package:osj_flutter/first_page.dart';
import 'package:osj_flutter/second_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      initialRoute: '/first',
      routes: {
        '/first': (context)=> FirstPage(),
        '/second': (context)=> SecondPage(),
      },
    );
  }
}
