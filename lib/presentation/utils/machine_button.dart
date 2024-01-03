import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/main.dart';
import 'package:lotura/presentation/utils/lotura_icons.dart';
import 'package:lotura/presentation/utils/machine_widget.dart';
import 'package:lotura/presentation/utils/osj_colors.dart';

class MachineButton extends MachineWidget {
  MachineButton({
    super.key,
    required int index,
    required bool isEnableNotification,
    required bool isWoman,
    required Status status,
    required Machine machine,
  }) : super(
          index: index,
          isEnableNotification: isEnableNotification,
          isWoman: isWoman,
          status: status,
          machine: machine,
        );

  final Map statusColor = <Status, Color>{
    Status.available: OSJColors.green50,
    Status.working: OSJColors.primary50,
    Status.disconnected: OSJColors.white,
    Status.breakdown: OSJColors.red50,
  };

  final Map statusIconColor = <Status, Color>{
    Status.available: OSJColors.green700,
    Status.working: OSJColors.primary700,
    Status.disconnected: OSJColors.black,
    Status.breakdown: OSJColors.red700,
  };

  final Map statusIcon = <Status, IconData>{
    Status.available: LoturaIcons.checkCircle,
    Status.working: LoturaIcons.working,
    Status.disconnected: LoturaIcons.disconnected,
    Status.breakdown: LoturaIcons.cancelCircle,
  };

  final Map machineIcon = <Machine, IconData>{
    Machine.wash: LoturaIcons.laundry,
    Machine.dry: LoturaIcons.dry,
  };

  final Map machineText = <Machine, String>{
    Machine.wash: "세탁기",
    Machine.dry: "건조기",
  };

  @override
  Widget build(BuildContext context) {
    return isEmptyContainer
        ? SizedBox(width: 154.0.w, height: 84.0.h)
        : GestureDetector(
            onTap: () => showModalOSJBottomSheet(context: context),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(machineIcon[machine],
                        size: 24.0.r, color: OSJColors.gray300),
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
