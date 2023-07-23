import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/main.dart';
import 'package:lotura/service/apply_cancle.dart';
import 'package:lotura/service/send_fcm_info.dart';
import 'package:lotura/widget/custom_colors.dart';
import 'package:lotura/widget/osj_icons.dart';
import 'package:lotura/widget/osj_text_button.dart';

class OSJBottomSheet extends StatelessWidget {
  OSJBottomSheet({
    super.key,
    required this.index,
    required this.isEnableNotification,
    required this.isWoman,
    required this.status,
    required this.machine,
    this.streamController,
  });

  final int index;
  final bool isEnableNotification, isWoman;
  final Status status;
  final Machine machine;
  StreamController? streamController;

  final Map statusColor = <Status, Color>{
    Status.available: OsjColor.green50,
    Status.working: OsjColor.primary50,
    Status.breakdown: OsjColor.red50,
  };

  final Map statusIcon = <Status, IconData>{
    Status.available: OSJIcons.checkCircle,
    Status.working: OSJIcons.working,
    Status.breakdown: OSJIcons.breakdown,
  };

  final Map machineIcon = <Machine, IconData>{
    Machine.WASH: OSJIcons.laundry,
    Machine.DRY: OSJIcons.dry,
  };

  final Map machineText = <Machine, String>{
    Machine.WASH: "세탁기",
    Machine.DRY: "건조기",
  };

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 220.0.h,
      child: Padding(
        padding: EdgeInsets.only(
          left: 24.0.w,
          right: 24.0.w,
          top: 32.0.h,
          bottom: 12.0.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isEnableNotification
                  ? '${isWoman ? index - 31 : index}번 ${machineText[machine]}를\n알림 설정 하실건가요?'
                  : '${isWoman ? index - 31 : index}번 ${machineText[machine]}의\n알림 설정을 해제하실건가요?',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22.0.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 24.0.h),
            Row(
              children: [
                OSJTextButton(
                    function: () => Navigator.of(context).pop(),
                    width: 185.0.w,
                    height: 56.0.h,
                    fontSize: 16.0.h,
                    color: OsjColor.gray100,
                    fontColor: OsjColor.black,
                    text: "취소"),
                SizedBox(width: 12.0.w),
                OSJTextButton(
                    function: () {
                      isEnableNotification
                          ? sendFcmInfo(index.toString())
                          : applyCancle(streamController!, index);
                      Navigator.pop(context);
                    },
                    width: 185.0.w,
                    height: 56.0.h,
                    fontSize: 16.0.h,
                    color: OsjColor.primary700,
                    fontColor: OsjColor.white,
                    text: isEnableNotification ? "알림 설정" : "알림 해제"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
