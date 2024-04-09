import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/presentation/utils/lotura_colors.dart';
import 'package:lotura/presentation/utils/osj_text_button.dart';
import 'package:url_launcher/url_launcher.dart';

class AppUpdatePage extends StatelessWidget {
  const AppUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        home: Scaffold(
          backgroundColor: Colors.grey[600],
          body: Center(
            child: Dialog(
              backgroundColor: LoturaColors.white,
              surfaceTintColor: LoturaColors.white,
              child: Container(
                padding: EdgeInsets.all(30.0.r),
                height: 270.0.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("업데이트 안내",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24.0.sp)),
                    SizedBox(height: 10.0.h),
                    const Expanded(
                      child: Text(
                        "Lotura의 새로운 버전이 출시되었어요!",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OSJTextButton(
                          function: () {
                            if (Platform.isAndroid) {
                              SystemNavigator.pop();
                            } else {
                              exit(0);
                            }
                          },
                          width: 130.0.w,
                          height: 60.0.h,
                          fontSize: 18.0.sp,
                          color: LoturaColors.gray100,
                          fontColor: LoturaColors.black,
                          text: "닫기",
                          radius: 8.0.r,
                        ),
                        OSJTextButton(
                          function: () async => await launchUrl(
                              Uri.parse(Platform.isAndroid
                                  ? "https://play.google.com/store/apps/details?id=com.osj.lotura"
                                  : "https://apps.apple.com/us/app/lotura/id6448836740"),
                              mode: LaunchMode.externalApplication),
                          width: 130.0.w,
                          height: 60.0.h,
                          fontSize: 18.0.sp,
                          color: LoturaColors.primary700,
                          fontColor: LoturaColors.white,
                          text: "업데이트",
                          radius: 8.0.r,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
