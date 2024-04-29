import 'package:apply_presentation/ui/view/apply_page.dart';
import 'package:core/lotura_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laundry_room_presentation/ui/view/laundry_room_page.dart';
import 'package:utils/osj_icon_button.dart';
import 'package:utils/osj_image_button.dart';

class BottomNavi extends StatefulWidget {
  const BottomNavi({super.key});

  @override
  State<BottomNavi> createState() => _BottomNaviState();
}

class _BottomNaviState extends State<BottomNavi>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  int selectedIndex = 1;
  bool isChange = false;

  final Map<int, int> placeIndex = {0: 0, 1: 16, 2: 31, 3: 44};

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LoturaColors.gray100,
      body: TabBarView(
        controller: controller,
        children: [
          ApplyPage(),
          LaundryRoomPage(),
        ],
      ),
      bottomNavigationBar: TabBar(
        padding: EdgeInsets.only(top: 10.0.h, bottom: 30.0.h),
        dividerColor: Colors.transparent,
        controller: controller,
        indicatorColor: Colors.transparent,
        tabs: [
          OSJIconButton(
              width: 185.0.w,
              height: 48.0.h,
              iconSize: 24.0.r,
              color: selectedIndex == 0
                  ? LoturaColors.white
                  : LoturaColors.gray100,
              iconColor: selectedIndex == 0
                  ? LoturaColors.primary700
                  : LoturaColors.gray300,
              iconData: Icons.home),
          OSJImageButton(
            width: 185.0.w,
            height: 48.0.h,
            color:
                selectedIndex == 1 ? LoturaColors.white : LoturaColors.gray100,
            imagePath: selectedIndex == 1
                ? "assets/applogo.jpeg"
                : "assets/applogo_unselected.jpeg",
          ),
        ],
      ),
    );
  }
}
