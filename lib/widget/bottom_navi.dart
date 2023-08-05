import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/domain/model/osj_list.dart';
import 'package:lotura/presentation/laundry_room_page/ui/view/laundry_room_page.dart';
import 'package:lotura/presentation/main_page/ui/view/main_page.dart';
import 'package:lotura/widget/osj_colors.dart';
import 'package:lotura/widget/osj_icon_button.dart';
import 'package:lotura/widget/osj_image_button.dart';

class BottomNavi extends StatefulWidget {
  const BottomNavi({super.key, required this.osjStreamController});

  final StreamController<OsjList> osjStreamController;

  @override
  State<BottomNavi> createState() => _BottomNaviState();
}

class _BottomNaviState extends State<BottomNavi>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  int selectedIndex = 1;
  bool isChange = false;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this)
      ..index = 1
      ..animation?.addListener(() {
        if (controller.offset >= 0.5 &&
            controller.offset < 1.0 &&
            isChange == false) {
          setState(() {
            isChange = true;
            selectedIndex = 1;
          });
        }
        if (controller.offset < 0.5 &&
            controller.offset > 0.0 &&
            isChange == true) {
          setState(() {
            isChange = false;
            selectedIndex = 0;
          });
        }
        if (controller.offset >= -0.5 &&
            controller.offset < 0.0 &&
            isChange == false) {
          setState(() {
            isChange = true;
            selectedIndex = 1;
          });
        }
        if (controller.offset < -0.5 &&
            controller.offset > -1.0 &&
            isChange == true) {
          setState(() {
            isChange = false;
            selectedIndex = 0;
          });
        }
        if (controller.offset == 1.0 || controller.offset == 0.0) {
          setState(() {
            isChange = false;
          });
        }
      });
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
      backgroundColor: OSJColors.gray100,
      body: StreamBuilder(
          stream: widget.osjStreamController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return TabBarView(
                controller: controller,
                children: [
                  const MainPage(),
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
        padding: EdgeInsets.only(top: 10.0.h, bottom: 10.0.h),
        controller: controller,
        indicatorColor: Colors.transparent,
        tabs: [
          OSJIconButton(
              width: 185.0.w,
              height: 48.0.h,
              iconSize: 24.0.r,
              color: selectedIndex == 0 ? OSJColors.white : OSJColors.gray100,
              iconColor:
                  selectedIndex == 0 ? OSJColors.primary700 : OSJColors.gray300,
              iconData: Icons.home),
          OSJImageButton(
            width: 185.0.w,
            height: 48.0.h,
            color: selectedIndex == 1 ? OSJColors.white : OSJColors.gray100,
            imagePath: selectedIndex == 1
                ? "assets/applogo.jpeg"
                : "assets/applogo_unselected.jpeg",
          ),
        ],
      ),
    );
  }
}
