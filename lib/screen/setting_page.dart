import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/widget/osj_colors.dart';
import 'package:lotura/widget/setting_page_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String mainLaundryRoom = "";
  int selectedIndex = 0;

  Future<void> initSharedPreferences() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    mainLaundryRoom = pref.getString('mainLaundryRoom') ?? "남자 학교측";
    selectedIndex = pref.getInt('selectedIndex') ?? 0;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    initSharedPreferences();
    return Scaffold(
      backgroundColor: OSJColors.gray100,
      appBar: AppBar(
        backgroundColor: OSJColors.gray100,
        elevation: 0.0,
        leadingWidth: 300.0.w,
        leading: Row(
          children: [
            IconButton(
              padding: EdgeInsets.only(left: 24.0.w, right: 12.0.w),
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.keyboard_arrow_left,
                color: OSJColors.black,
                size: 24.0.w,
              ),
            ),
            Text(
              "설정",
              style: TextStyle(fontSize: 24.0.sp, color: OSJColors.black),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 24.0.w,
          right: 24.0.w,
          top: 12.0.h,
          bottom: 12.0.h,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(12.0.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "메인 세탁실 설정",
                    style: TextStyle(fontSize: 16.0.sp),
                  ),
                  GestureDetector(
                    onTap: () => showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(24.r),
                          ),
                        ),
                        backgroundColor: OSJColors.white,
                        builder: (context) => SettingPageBottomSheet(
                              mainLaundryRoom: mainLaundryRoom,
                              selectedIndex: selectedIndex,
                            )),
                    child: Row(
                      children: [
                        Text(
                          mainLaundryRoom,
                          style: TextStyle(
                            fontSize: 16.0.sp,
                            color: OSJColors.primary700,
                          ),
                        ),
                        SizedBox(width: 12.0.w),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: OSJColors.gray300,
                          size: 24.0.r,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.0.h),
            Padding(
              padding: EdgeInsets.all(12.0.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "문의하기",
                    style: TextStyle(fontSize: 16.0.sp),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await launchUrl(
                          Uri.parse('https://open.kakao.com/o/sHjnH1Se'),
                          mode: LaunchMode.externalApplication);
                    },
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      color: OSJColors.gray300,
                      size: 24.0.r,
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
