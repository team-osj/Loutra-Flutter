import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/presentation/utils/osj_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPageBottomSheet extends StatefulWidget {
  SettingPageBottomSheet({
    super.key,
    required this.mainLaundryRoom,
    required this.selectedIndex,
  });

  String mainLaundryRoom;
  int selectedIndex;

  @override
  State<SettingPageBottomSheet> createState() => _SettingPageBottomSheetState();
}

class _SettingPageBottomSheetState extends State<SettingPageBottomSheet> {
  void changeMainLaundryRoom(int index) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref = await SharedPreferences.getInstance();
    if (index == 0) {
      widget.mainLaundryRoom = "남자 학교측";
    } else if (index == 1) {
      widget.mainLaundryRoom = "남자 기숙사측";
    } else {
      widget.mainLaundryRoom = "여자";
    }
    pref.setString('mainLaundryRoom', widget.mainLaundryRoom);
    pref.setInt('selectedIndex', widget.selectedIndex);
  }

  @override
  void dispose() {
    super.dispose();
    changeMainLaundryRoom(widget.selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 310.0.h,
      child: Padding(
        padding: EdgeInsets.only(
          top: 32.0.h,
          left: 24.0.w,
          right: 24.0.w,
          bottom: 12.0.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "메인 세탁실 설정",
              style: TextStyle(
                  color: OSJColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0.sp),
            ),
            SizedBox(height: 4.0.h),
            Text(
              "세탁실 탭에서 처음에 보여질 세탁실을 선택해보세요.",
              style: TextStyle(fontSize: 16.0.sp, color: OSJColors.black),
            ),
            SizedBox(height: 24.0.h),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.selectedIndex = 0;
                });
              },
              child: Container(
                width: 382.0.w,
                height: 48.0.h,
                decoration: BoxDecoration(
                  color: widget.selectedIndex == 0
                      ? OSJColors.gray100
                      : OSJColors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.all(12.0.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "남자 학교측",
                      style: TextStyle(
                        fontSize: 16.0.sp,
                        color: OSJColors.black,
                      ),
                    ),
                    Icon(
                      Icons.check,
                      size: 24.0.r,
                      color: widget.selectedIndex == 0
                          ? OSJColors.black
                          : OSJColors.white,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.selectedIndex = 1;
                });
              },
              child: Container(
                width: 382.0.w,
                height: 48.0.h,
                decoration: BoxDecoration(
                  color: widget.selectedIndex == 1
                      ? OSJColors.gray100
                      : OSJColors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.all(12.0.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "남자 기숙사측",
                      style: TextStyle(
                        fontSize: 16.0.sp,
                        color: OSJColors.black,
                      ),
                    ),
                    Icon(
                      Icons.check,
                      size: 24.0.r,
                      color: widget.selectedIndex == 1
                          ? OSJColors.black
                          : OSJColors.white,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.selectedIndex = 2;
                });
              },
              child: Container(
                width: 382.0.w,
                height: 48.0.h,
                decoration: BoxDecoration(
                  color: widget.selectedIndex == 2
                      ? OSJColors.gray100
                      : OSJColors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.all(12.0.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "여자",
                      style: TextStyle(
                        fontSize: 16.0.sp,
                        color: OSJColors.black,
                      ),
                    ),
                    Icon(
                      Icons.check,
                      size: 24.0.r,
                      color: widget.selectedIndex == 2
                          ? OSJColors.black
                          : OSJColors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
