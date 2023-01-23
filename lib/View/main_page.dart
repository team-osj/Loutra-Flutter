import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:osj_flutter/View/first_page.dart';
import 'package:osj_flutter/View/second_page.dart';
import 'package:osj_flutter/model/list_model.dart';
import 'package:osj_flutter/view_model/get_status.dart';
import 'package:osj_flutter/Widget/setting_dialog.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:osj_flutter/baseurl.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  StreamController<OsjList> streamController = StreamController<OsjList>();
  IO.Socket socket = IO.io(
      '$baseurl/application',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .enableAutoConnect()
          .build());

  @override
  void initState() {
    super.initState();
    socket.onConnect((data) {
      print('연결 성공');
    });
    socket.on(
        'update',
        (data) =>
            streamController.sink.add(OsjList.fromJson(jsonDecode(data))));
    socket.onDisconnect((_) => print('disconnect'));
    socket.onConnectError((data) => print('CE : $data'));
    socket.onError((data) => print('E : $data'));
    socket.connect;
    controller = TabController(length: 2, vsync: this);
    // streamController.stream.listen((event) {
    //   print("데이터가 들어가면 출력됨");
    // });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<OsjList>(
      stream: streamController.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final OsjList? result = snapshot.data;
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.0,
                actions: [
                  Builder(builder: (BuildContext contest) {
                    return IconButton(
                        padding: EdgeInsets.only(left: 20.0.w, right: 30.0.w),
                        onPressed: () {
                          showSettingPopup(context);
                        },
                        icon: const Icon(Icons.settings),
                        color: Colors.black);
                  }),
                ],
              ),
              body: Padding(
                padding: EdgeInsets.all(3.0.r),
                child: TabBarView(
                  controller: controller,
                  children: [
                    FirstPage(osjList: result!),
                    SecondPage(osjList: result!),
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
          return Center(child: Text(snapshot.error.toString()));
        } else {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              actions: [
                IconButton(
                    padding: EdgeInsets.only(right: 30.0.w),
                    onPressed: () {},
                    icon: const Icon(Icons.settings, color: Colors.black)),
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
