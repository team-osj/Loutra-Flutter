import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/main.dart';
import 'package:lotura/widget/custom_colors.dart';
import 'package:lotura/widget/custom_row_buttons.dart';
import 'package:lotura/widget/osj_icons.dart';
import 'package:lotura/widget/osj_text_button.dart';

class LaundryRoomPage extends StatefulWidget {
  const LaundryRoomPage({super.key});

  @override
  State<LaundryRoomPage> createState() => _LaundryRoomPageState();
}

class _LaundryRoomPageState extends State<LaundryRoomPage> {
  int isSelectedIcon = 0, isSelectedPlace = 0;

  Map place = <int, String>{
    0: "남자 기숙사측 세탁실",
    1: "남자 학교측 세탁실",
    2: "여자 세탁실",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OsjColor.gray100,
      appBar: AppBar(
        backgroundColor: OsjColor.gray100,
        elevation: 0.0,
        leadingWidth: 300.0.w,
        leading: Row(
          children: [
            SizedBox(width: 24.0.w),
            Text(
              place[isSelectedPlace],
              style: TextStyle(
                color: OsjColor.black,
                fontSize: 24.0.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings, color: OsjColor.black),
          ),
          SizedBox(width: 24.0.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24.0.w, right: 24.0.w),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 12.0.h,
                bottom: 12.0.h,
              ),
              child: Row(
                children: [
                  OSJTextButton(
                    function: () => setState(() => isSelectedPlace = 0),
                    width: 111.0.w,
                    height: 32.0.h,
                    fontSize: 16.0.sp,
                    color: isSelectedPlace == 0
                        ? OsjColor.white
                        : OsjColor.gray100,
                    fontColor: isSelectedPlace == 0
                        ? OsjColor.primary700
                        : OsjColor.gray300,
                    text: "남자 기숙사측",
                    radius: 8.0,
                  ),
                  SizedBox(width: 8.0.w),
                  OSJTextButton(
                    function: () => setState(() => isSelectedPlace = 1),
                    width: 99.0.w,
                    height: 32.0.h,
                    fontSize: 16.0.sp,
                    color: isSelectedPlace == 1
                        ? OsjColor.white
                        : OsjColor.gray100,
                    fontColor: isSelectedPlace == 1
                        ? OsjColor.primary700
                        : OsjColor.gray300,
                    text: "남자 학교측",
                    radius: 8.0,
                  ),
                  SizedBox(width: 8.0.w),
                  OSJTextButton(
                    function: () => setState(() => isSelectedPlace = 2),
                    width: 53.0.w,
                    height: 32.0.h,
                    fontSize: 16.0.sp,
                    color: isSelectedPlace == 2
                        ? OsjColor.white
                        : OsjColor.gray100,
                    fontColor: isSelectedPlace == 2
                        ? OsjColor.primary700
                        : OsjColor.gray300,
                    text: "여자",
                    radius: 8.0,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isSelectedIcon = 0;
                    });
                  },
                  icon: Icon(OSJIcons.grid,
                      size: 18.0.r,
                      color: isSelectedIcon == 0
                          ? OsjColor.black
                          : OsjColor.gray300),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        isSelectedIcon = 1;
                      });
                    },
                    icon: Icon(
                      OSJIcons.list,
                      size: 18.0.r,
                      color: isSelectedIcon == 1
                          ? OsjColor.black
                          : OsjColor.gray300,
                    )),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 16,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CustomRowButton(
                        isSelectedIcon: isSelectedIcon,
                        leftIndex: index,
                        leftStatus: Status.working,
                        leftMachine: Machine.laundryMachine,
                        rightIndex: index + 8,
                        rightStatus: Status.available,
                        rightMachine: Machine.dryMachine,
                      ),
                      SizedBox(height: 10.0.h),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
