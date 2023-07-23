import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/main.dart';
import 'package:lotura/widget/custom_colors.dart';
import 'package:lotura/widget/osj_bottom_sheet.dart';
import 'package:lotura/widget/osj_icons.dart';

class MachineButton extends StatelessWidget {
  MachineButton({
    super.key,
    required this.index,
    required this.isEnableNotification,
    required this.isWoman,
    required this.status,
    required this.machine,
    this.osjStreamController,
  });

  final int index;
  final bool isEnableNotification, isWoman;
  final Status status;
  final Machine machine;
  StreamController? osjStreamController;

  final Map statusColor = <Status, Color>{
    Status.available: OsjColor.green50,
    Status.working: OsjColor.primary50,
    Status.breakdown: OsjColor.red50,
  };

  final Map statusIconColor = <Status, Color>{
    Status.available: OsjColor.green700,
    Status.working: OsjColor.primary700,
    Status.breakdown: OsjColor.red700,
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
    return (!isWoman && index == 32) || (isWoman && index == -1)
        ? SizedBox(width: 154.0.w, height: 84.0.h)
        : GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25.r),
                  ),
                ),
                builder: (context) => OSJBottomSheet(
                  index: index,
                  isEnableNotification: isEnableNotification,
                  isWoman: isWoman,
                  status: status,
                  machine: machine,
                  osjStreamController:
                      isEnableNotification ? null : osjStreamController,
                ),
              );
            },
            child: Container(
              width: 154.0.w,
              height: 84.0.h,
              decoration: BoxDecoration(
                color: statusColor[status],
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding:
                    EdgeInsets.only(top: 12.0.h, bottom: 12.0.h, left: 24.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(machineIcon[machine],
                        size: 24.0.r, color: OsjColor.gray300),
                    SizedBox(height: 12.0.h),
                    Row(
                      children: [
                        Text("${isWoman ? index - 31 : index}번",
                            style: TextStyle(fontSize: 16.0.sp)),
                        SizedBox(
                            width: (isWoman ? index - 31 : index) < 10
                                ? 10.2.w
                                : 5.0.w),
                        Text(machineText[machine],
                            style: TextStyle(fontSize: 16.0.sp)),
                        SizedBox(width: 8.0.w),
                        Icon(
                          statusIcon[status],
                          size: 18.0.r,
                          color: statusIconColor[status],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
