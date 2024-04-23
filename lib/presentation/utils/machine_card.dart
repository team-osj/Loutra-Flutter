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
        ? SizedBox(width: 185.0.w, height: 256.0.h)
        : GestureDetector(
            onTap: () => showModalOSJBottomSheet(context: context),
            child: Container(
              width: 185.0.w,
              height: 256.0.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  SizedBox(height: 24.0.h),
                  Image.asset(
                    deviceType.imagePath,
                    width: 120.0.r,
                    height: 120.0.r,
                  ),
                  SizedBox(height: 12.0.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${isWoman ? deviceId - 31 : deviceId}번 ",
                        style: TextStyle(
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        deviceType.text,
                        style: TextStyle(fontSize: 16.0.sp),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.0.h),
                  OSJStatusButton(
                    state: state,
                  ),
                ],
              ),
            ),
          );
  }
}
