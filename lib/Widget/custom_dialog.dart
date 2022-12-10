import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osj_flutter/view_model/get_fcm.dart';

void showPopup(context, int deviceId) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
            //모서리 둥글게 깎기
            borderRadius: BorderRadius.circular(20.0)),
        child: SizedBox(
          width: 200.0.w,
          height: 200.0.h,
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
                //모서리 둥글게 깎기
                borderRadius: BorderRadius.circular(20.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 40.0.h),
                  child: Text(
                    '[$deviceId]번 세탁기/건조기\n알림을 받으시겠습니까?',
                    style: TextStyle(
                      fontSize: 20.0.sp,
                    ),
                  ),
                ),
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
            ),
          ),
        ),
      );
    },
  );
}
