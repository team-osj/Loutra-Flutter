import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/widget/custom_colors.dart';
import 'package:lotura/widget/setting_page_bottom_sheet.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

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
            IconButton(
              padding: EdgeInsets.only(left: 24.0.w, right: 12.0.w),
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.keyboard_arrow_left,
                color: OsjColor.black,
                size: 24.0.w,
              ),
            ),
            Text(
              "설정",
              style: TextStyle(fontSize: 24.0.sp, color: OsjColor.black),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 24.0.w,
          right: 24.0.w,
          top: 12.0.h,
          bottom: 12.0.h,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(12.0.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "메인 세탁실 설정",
                    style: TextStyle(fontSize: 16.0.sp),
                  ),
                  GestureDetector(
                    onTap: () => showModalBottomSheet(
                        context: context,
                        builder: (context) => SettingPageBottomSheet()),
                    child: Row(
                      children: [
                        Text(
                          "남자 기숙사측",
                          style: TextStyle(
                            fontSize: 16.0.sp,
                            color: OsjColor.primary700,
                          ),
                        ),
                        SizedBox(width: 12.0.w),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: OsjColor.gray300,
                          size: 24.0.r,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.0.h),
            Padding(
              padding: EdgeInsets.all(12.0.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "문의하기",
                    style: TextStyle(fontSize: 16.0.sp),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: OsjColor.gray300,
                    size: 24.0.r,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
