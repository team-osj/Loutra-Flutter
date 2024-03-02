import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/domain/entity/room_entity.dart';
import 'package:lotura/presentation/setting_page/bloc/room_bloc.dart';
import 'package:lotura/presentation/setting_page/bloc/room_event.dart';
import 'package:lotura/presentation/setting_page/bloc/room_state.dart';
import 'package:lotura/presentation/setting_page/ui/widget/setting_page_bottom_sheet.dart';
import 'package:lotura/presentation/utils/lotura_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  void initState() {
    super.initState();
    context.read<RoomBloc>().add(GetRoomIndexEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LoturaColors.gray100,
      appBar: AppBar(
        backgroundColor: LoturaColors.gray100,
        elevation: 0.0,
        leadingWidth: 300.0.w,
        leading: Row(
          children: [
            IconButton(
              padding: EdgeInsets.only(left: 24.0.w, right: 12.0.w),
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.keyboard_arrow_left,
                color: LoturaColors.black,
                size: 24.0.w,
              ),
            ),
            Text(
              "설정",
              style: TextStyle(fontSize: 24.0.sp, color: LoturaColors.black),
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
                      BlocBuilder<RoomBloc, RoomState<LaundryRoomEntity>>(
                        builder: (context, state) {
                          return switch (state) {
                            Initial() => const SizedBox.shrink(),
                            Changed() => GestureDetector(
                                onTap: () => showModalBottomSheet(
                                    context: context,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(24.r),
                                      ),
                                    ),
                                    backgroundColor: LoturaColors.white,
                                    builder: (context) =>
                                        SettingPageBottomSheet(
                                          initialIndex:
                                              state.value.roomLocation.index,
                                        )),
                                child: Text(
                                  state.value.roomLocation.roomName,
                                  style: TextStyle(
                                    fontSize: 16.0.sp,
                                    color: LoturaColors.primary700,
                                  ),
                                ),
                              ),
                          };
                        },
                      ),
                      SizedBox(width: 12.0.w),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: LoturaColors.gray300,
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
                        color: LoturaColors.gray300,
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
