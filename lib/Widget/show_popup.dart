import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osj_flutter/view_model/get_fcm.dart';

void showPopup(context, String deviceId) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            //모서리 둥글게 깎기
            borderRadius: BorderRadius.circular(10.0)),
        title: Column(
          children: [
            Text(
              '[$deviceId]번 세탁기/건조기\n알림을 받으시겠습니까?',
              style: TextStyle(fontSize: 22.0.sp),
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
                  getFcm(deviceId);
                  Navigator.of(context).pop();
                },
                child: Text(
                  '확인',
                  style: TextStyle(fontSize: 15.0.sp),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
