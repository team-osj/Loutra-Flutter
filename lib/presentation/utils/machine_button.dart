import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/presentation/utils/lotura_colors.dart';
import 'package:lotura/presentation/utils/machine_widget.dart';

class MachineButton extends MachineWidget {
  const MachineButton({
    super.key,
    required super.index,
    required super.isEnableNotification,
    required super.isWoman,
    required super.state,
    required super.machine,
  });

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
                color: state.color,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding:
                    EdgeInsets.only(top: 12.0.h, bottom: 12.0.h, left: 24.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(machine.icon,
                        size: 24.0.r, color: LoturaColors.gray300),
                    Row(
                      children: [
                        Text("${isWoman ? index - 31 : index}번",
                            style: TextStyle(fontSize: 16.0.sp)),
                        SizedBox(
                            width: (isWoman ? index - 31 : index) < 10
                                ? 10.2.w
                                : 5.0.w),
                        Text(machine.text, style: TextStyle(fontSize: 16.0.sp)),
                        SizedBox(width: 8.0.w),
                        Icon(
                          state.icon,
                          size: 18.0.r,
                          color: state.deepColor,
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
