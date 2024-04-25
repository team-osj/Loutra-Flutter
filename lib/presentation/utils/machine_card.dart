import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/presentation/utils/machine_widget.dart';
import 'package:lotura/presentation/utils/osj_status_button.dart';

class MachineCard extends MachineWidget {
  const MachineCard({
    super.key,
    required super.deviceId,
    required super.isEnableNotification,
    required super.isWoman,
    required super.deviceType,
    required super.state,
  });

  @override
  Widget build(BuildContext context) {
    return isEmptyContainer
        ? Container(
            width: 170.0.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.transparent,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  deviceType.imagePath,
                  width: 100.0.r,
                  height: 100.0.r,
                  color: Colors.transparent,
                ),
                Text(
                  "12번 건조기",
                  textScaler: TextScaler.noScaling,
                  style: TextStyle(
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.transparent),
                ),
                OSJStatusButton(
                  state: state,
                  emptyStatus: true,
                ),
              ],
            ),
          )
        : GestureDetector(
            onTap: () => showModalOSJBottomSheet(context: context),
            child: Container(
              width: 170.0.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    deviceType.imagePath,
                    width: 100.0.r,
                    height: 100.0.r,
                  ),
                  Text(
                    "${isWoman ? deviceId - 31 : deviceId}번 ${deviceType.text}",
                    textScaler: TextScaler.noScaling,
                    style: TextStyle(
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  OSJStatusButton(
                    state: state,
                  ),
                ],
              ),
            ),
          );
  }
}
