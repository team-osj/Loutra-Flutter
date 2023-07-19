import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/widget/custom_colors.dart';
import 'package:lotura/widget/osj_icons.dart';
import 'package:lotura/widget/osj_text_button.dart';

class LaundryRoomPage extends StatefulWidget {
  const LaundryRoomPage({super.key});

  @override
  State<LaundryRoomPage> createState() => _LaundryRoomPageState();
}

class _LaundryRoomPageState extends State<LaundryRoomPage> {
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
              '남자 기숙사측 세탁실',
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
    );
  }
}
