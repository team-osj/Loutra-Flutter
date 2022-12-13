import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showSettingPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
            //모서리 둥글게 깎기
            borderRadius: BorderRadius.circular(20.0)),
        child: SizedBox(
          width: 200.0.w,
          height: 180.0.h,
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
                //모서리 둥글게 깎기
                borderRadius: BorderRadius.circular(20.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                    onPressed: () {},
                    child: Text(
                      '문의사항',
                      style: TextStyle(fontSize: 20.0.sp),
                    )),
                SizedBox(height: 20.0.h),
                MaterialButton(
                    onPressed: () {},
                    child: Text(
                      '개발자 소개',
                      style: TextStyle(fontSize: 20.0.sp),
                    )),
              ],
            ),
          ),
        ),
      );
    },
  );
}
