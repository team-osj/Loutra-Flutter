import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/model/osj_list.dart';
import 'package:lotura/screen/laundry_room_page.dart';
import 'package:lotura/screen/main_page.dart';
import 'package:lotura/widget/custom_colors.dart';
import 'package:lotura/widget/osj_icon_button.dart';
import 'package:lotura/widget/osj_image_button.dart';

class BottomNavi extends StatefulWidget {
  BottomNavi({super.key, required this.osjStreamController});

  StreamController<OsjList> osjStreamController;

  @override
  State<BottomNavi> createState() => _BottomNaviState();
}

class _BottomNaviState extends State<BottomNavi>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this)
      ..addListener(() => setState(() => selectedIndex = controller.index));
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    widget.osjStreamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OsjColor.gray100,
      body: StreamBuilder(
          stream: widget.osjStreamController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller,
                children: [
                  MainPage(osjList: snapshot.data!),
                  LaundryRoomPage(osjList: snapshot.data!),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      bottomNavigationBar: TabBar(
        padding: EdgeInsets.only(top: 10.0.h, bottom: 34.0.h),
        controller: controller,
        indicatorColor: Colors.transparent,
        tabs: [
          OSJIconButton(
              width: 185.0.w,
              height: 48.0.h,
              iconSize: 24.0.r,
              color: controller.index == 0 ? OsjColor.white : OsjColor.gray100,
              iconColor: controller.index == 0
                  ? OsjColor.primary700
                  : OsjColor.gray300,
              iconData: Icons.home),
          OSJImageButton(
            width: 185.0.w,
            height: 48.0.h,
            color: controller.index == 1 ? OsjColor.white : OsjColor.gray100,
            imagePath: controller.index == 1
                ? "assets/applogo.jpeg"
                : "assets/applogo_unselected.jpeg",
          ),
        ],
      ),
    );
  }
}
