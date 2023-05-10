import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/screen/first_page.dart';
import 'package:lotura/screen/second_page.dart';
import 'package:lotura/init/socket_init.dart';
import 'package:lotura/model/osj_list.dart';
import 'package:lotura/Widget/setting_dialog.dart';
import 'package:lotura/widget/stream_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  late StreamController<OsjList> osjStreamController;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    osjStreamController = StreamController<OsjList>();
    socketInit(osjStreamController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              padding: EdgeInsets.only(left: 20.0.w),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu, color: Colors.black));
          },
        ),
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                  padding: EdgeInsets.only(left: 20.0.w, right: 30.0.w),
                  onPressed: () {
                    showSettingPopup(context);
                  },
                  icon: const Icon(Icons.settings),
                  color: Colors.black);
            },
          ),
        ],
      ),
      drawer: StreamDrawer(),
      body: StreamBuilder<OsjList>(
          stream: osjStreamController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: EdgeInsets.all(3.0.r),
                child: TabBarView(
                  controller: controller,
                  children: [
                    FirstPage(osjList: snapshot.data!),
                    SecondPage(osjList: snapshot.data!),
                  ],
                ),
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "서버에서 데이터를 받아오는중...",
                      style: TextStyle(
                        fontSize: 20.0.sp,
                        fontFamily: 'NanumGothicCoding',
                      ),
                    ),
                    SizedBox(height: 20.0.h),
                    Image.asset(
                      "assets/applogo.jpg",
                      width: 100.0.r,
                      height: 100.0.r,
                    ),
                  ],
                ),
              );
            }
          }),
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
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }
}
