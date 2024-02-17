import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/domain/entity/room_entity.dart';
import 'package:lotura/presentation/setting_page/bloc/room_bloc.dart';
import 'package:lotura/presentation/setting_page/bloc/room_event.dart';
import 'package:lotura/presentation/setting_page/bloc/room_state.dart';
import 'package:lotura/presentation/setting_page/ui/widget/setting_page_bottom_sheet.dart';
import 'package:lotura/presentation/utils/osj_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String mainLaundryRoom = "";

  final Map place = <int, String>{
    0: "남자 학교측 세탁실",
    1: "남자 기숙사측 세탁실",
    2: "여자 세탁실",
  };

  @override
  void initState() {
    super.initState();
    context.read<RoomBloc>().add(GetRoomIndexEvent());
    //initSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    //initSharedPreferences();
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
                  Row(
                    children: [
                      BlocBuilder<RoomBloc, RoomState<RoomEntity>>(
                        builder: (context, state) {
                          if (state is Initial) {
                            return const SizedBox.shrink();
                          } else if (state is Changed) {
                            return GestureDetector(
                              onTap: () => showModalBottomSheet(
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(24.r),
                                    ),
                                  ),
                                  backgroundColor: OSJColors.white,
                                  builder: (context) => SettingPageBottomSheet(
                                        initialIndex: state.value.roomIndex,
                                      )),
                              child: Text(
                                place[state.value.roomIndex],
                                style: TextStyle(
                                  fontSize: 16.0.sp,
                                  color: OSJColors.primary700,
                                ),
                              ),
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                      SizedBox(width: 12.0.w),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: OSJColors.gray300,
                        size: 24.0.r,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.0.h),
            Padding(
              padding: EdgeInsets.all(12.0.r),
              child: GestureDetector(
                onTap: () async {
                  await launchUrl(
                      Uri.parse('https://open.kakao.com/o/sHjnH1Se'),
                      mode: LaunchMode.externalApplication);
                },
                child: Container(
                  width: double.infinity,
                  height: 30.0.r,
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "문의하기",
                        style: TextStyle(fontSize: 16.0.sp),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: OSJColors.gray300,
                        size: 24.0.r,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
