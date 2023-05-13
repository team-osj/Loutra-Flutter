import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/service/apply_cancle.dart';
import 'package:lotura/widget/custom_colors.dart';

void removePopup(
    StreamController controller, context, int deviceId, String deviceType) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      if (Theme.of(context).platform == TargetPlatform.android) {
        return AlertDialog(
          insetPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              //모서리 둥글게 깎기
              borderRadius: BorderRadius.circular(10.0)),
          title: Column(
            children: [
              Text(
                "$deviceId번 ${deviceType == "DRY" ? "건조기" : "세탁기"} 알림 신청을",
                style: TextStyle(
                  fontSize: 20.0.sp,
                ),
              ),
              Text(
                "취소하시겠습니까?",
                style: TextStyle(
                  fontSize: 20.0.sp,
                ),
              ),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    '취소',
                    style: TextStyle(fontSize: 15.0.sp),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    applyCancle(controller, deviceId);
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    '확인',
                    style: TextStyle(fontSize: 15.0.sp),
                  ),
                ),
              ],
            )
          ],
        );
      } else {
        return CupertinoAlertDialog(
          title: Column(
            children: [
              Text(
                "$deviceId번 ${deviceType == "DRY" ? "건조기" : "세탁기"} 알림 신청을",
                style: TextStyle(
                  fontSize: 20.0.sp,
                ),
              ),
              Text(
                "취소하시겠습니까?",
                style: TextStyle(
                  fontSize: 20.0.sp,
                ),
              ),
            ],
          ),
          actions: [
            CupertinoDialogAction(
              child: Text(
                "Cancel",
                style: TextStyle(fontSize: 16.0.sp, color: customRed),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            CupertinoDialogAction(
              child: Text(
                "OK",
                style: TextStyle(fontSize: 16.0.sp),
              ),
              onPressed: () {
                applyCancle(controller, deviceId);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    },
  );
}
