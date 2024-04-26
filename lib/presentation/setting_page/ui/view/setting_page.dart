import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/presentation/setting_page/bloc/room_bloc.dart';
import 'package:lotura/presentation/setting_page/bloc/room_event.dart';
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
        toolbarHeight: 90.0.r,
        leading: IconButton(
          padding: EdgeInsets.only(left: 24.0.r),
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: LoturaColors.black,
            size: 30.0.r,
          ),
        ),
        title: Text(
          "설정",
          style: TextStyle(
            fontSize: 24.0.sp,
            color: LoturaColors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.0.r,
          vertical: 12.0.r,
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24.r),
                    ),
                  ),
                  backgroundColor: LoturaColors.white,
                  builder: (context) {
                    context.read<RoomBloc>().add(GetRoomIndexEvent());
                    return const SettingPageBottomSheet();
                  }),
              behavior: HitTestBehavior.translucent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      "메인 세탁실 설정",
                      style: TextStyle(fontSize: 18.0.sp),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: LoturaColors.gray300,
                    size: 30.0.r,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.0.r),
            GestureDetector(
              onTap: () async => await launchUrl(
                  Uri.parse('https://open.kakao.com/o/sHjnH1Se'),
                  mode: LaunchMode.externalApplication),
              behavior: HitTestBehavior.translucent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "문의하기",
                    style: TextStyle(fontSize: 18.0.sp),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: LoturaColors.gray300,
                    size: 30.0.r,
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
