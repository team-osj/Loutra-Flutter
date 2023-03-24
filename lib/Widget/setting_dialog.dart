import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

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
          height: 160.0.h,
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
                //모서리 둥글게 깎기
                borderRadius: BorderRadius.circular(20.0)),
            child: MaterialButton(
              onPressed: () async {
                await launchUrl(Uri.parse('https://open.kakao.com/o/sHjnH1Se'),
                    mode: LaunchMode.externalApplication);
              },
              child: Text(
                '문의사항',
                style: TextStyle(fontSize: 20.0.sp),
              ),
            ),
          ),
        ),
      );
    },
  );
}
