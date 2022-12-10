import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osj_flutter/first_page.dart';
import 'package:osj_flutter/model/list_model.dart';
import 'package:osj_flutter/second_page.dart';
import 'package:osj_flutter/view_model/get_status.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  Future<OsjList>? future;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    future = getStatus();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(onPressed: () {
                    getStatus();
                  }, icon: Icon(Icons.refresh))
                ],
              ),
              body: Padding(
                padding: EdgeInsets.all(3.0.r),
                child: TabBarView(
                  children: <Widget>[
                    FirstPage(future: future),
                    SecondPage(future: future),
                  ],
                  controller: controller,
                ),
              ),
              bottomNavigationBar: TabBar(
                tabs: <Tab>[
                  const Tab(
                    icon: Icon(
                      Icons.looks_one,
                      color: Colors.black,
                    ),
                  ),
                  const Tab(
                    icon: Icon(
                      Icons.looks_two,
                      color: Colors.black,
                    ),
                  ),
                ],
                controller: controller,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else
          return Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }
}
