import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/widget/custom_colors.dart';

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
    );
  }
}
