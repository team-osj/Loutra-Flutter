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
              child: Padding(
                padding: EdgeInsets.all(30.0.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8.0.h),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0.w),
                        child: Text(
                          '이 기기를 구독하시겠습니까?',
                          style: TextStyle(
                            fontSize: 20.0.sp,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.0.w, right: 30.0.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              '취소',
                              style: TextStyle(fontSize: 20.0.sp),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              getFcm(deviceId);
                            },
                            child: Text(
                              '확인',
                              style: TextStyle(fontSize: 20.0.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
