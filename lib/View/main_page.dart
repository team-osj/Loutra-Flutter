import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osj_flutter/View/first_page.dart';
import 'package:osj_flutter/View/second_page.dart';
import 'package:osj_flutter/model/list_model.dart';
import 'package:osj_flutter/view_model/get_status.dart';
import 'package:osj_flutter/Widget/setting_dialog.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  bool isClicked = true;
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
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.0,
                actions: [
                  IconButton(
                      onPressed: () {
                        if (!isClicked) return null;
                        getStatus();
                        setState(() {
                          isClicked = false;
                        });
                        Future.delayed(Duration(seconds: 3), () {
                          setState(() {
                            isClicked = true;
                          });
                        });
                      },
                      icon: isClicked
                          ? Icon(Icons.refresh, color: Colors.black)
                          : SizedBox(
                              width: 18.0.w,
                              height: 18.0.w,
                              child: CircularProgressIndicator(
                                color: Colors.black,
                              ))),
                  Builder(builder: (BuildContext contest) {
                    return IconButton(
                        padding: EdgeInsets.only(left: 20.0.w, right: 30.0.w),
                        onPressed: () {
                          showSettingPopup(context);
                        },
                        icon: Icon(Icons.settings),
                        color: Colors.black);
                  }),
                ],
              ),
              body: Padding(
                padding: EdgeInsets.all(3.0.r),
                child: TabBarView(
                  controller: controller,
                  children: [
                    FirstPage(future: future),
                    SecondPage(future: future),
                  ],
                ),
              ),
              bottomNavigationBar: TabBar(
                tabs: const <Tab>[
                  Tab(
                    icon: Icon(
                      Icons.looks_one,
                      color: Colors.black,
                    ),
                  ),
                  Tab(
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
        } else {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              leading: const Icon(Icons.menu),
              actions: [
                IconButton(
                    padding: EdgeInsets.only(right: 30.0.w),
                    onPressed: () {},
                    icon: const Icon(Icons.refresh, color: Colors.black)),
              ],
            ),
            body: const Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }
}
