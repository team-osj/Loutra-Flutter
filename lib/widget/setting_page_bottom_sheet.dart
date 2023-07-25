import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/widget/custom_colors.dart';

class SettingPageBottomSheet extends StatelessWidget {
  const SettingPageBottomSheet({super.key});

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
                  color: OsjColor.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0.sp),
            ),
            SizedBox(height: 4.0.h),
            Text(
              "세탁실 탭에서 처음에 보여질 세탁실을 선택해보세요.",
              style: TextStyle(fontSize: 16.0.sp, color: OsjColor.black),
            ),
            SizedBox(height: 24.0.h),
            Container(
              width: 382.0.w,
              height: 48.0.h,
              decoration: BoxDecoration(
                color: OsjColor.gray100,
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
                      color: OsjColor.black,
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: Icon(
                      Icons.check,
                      size: 24.0.r,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 382.0.w,
              height: 48.0.h,
              decoration: BoxDecoration(
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
                      color: OsjColor.black,
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: Icon(
                      Icons.check,
                      size: 24.0.r,
                      color: OsjColor.gray100,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 382.0.w,
              height: 48.0.h,
              decoration: BoxDecoration(
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
                      color: OsjColor.black,
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: Icon(
                      Icons.check,
                      size: 24.0.r,
                      color: OsjColor.gray100,
                    ),
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
