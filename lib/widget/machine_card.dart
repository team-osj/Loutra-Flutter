import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/main.dart';
import 'package:lotura/widget/osj_bottom_sheet.dart';
import 'package:lotura/widget/osj_status_button.dart';

class MachineCard extends StatelessWidget {
  const MachineCard(
      {super.key,
      required this.index,
      required this.isEnableNotification,
      required this.isWoman,
      required this.machine,
      required this.status});

  final int index;
  final bool isEnableNotification, isWoman;
  final Machine machine;
  final Status status;

  @override
  Widget build(BuildContext context) {
    return (!isWoman && index == 31) || (isWoman && index == -1)
        ? SizedBox(width: 185.0.w, height: 256.0.h)
        : GestureDetector(
            onTap: () => showModalBottomSheet(
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
              ),
            ),
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
                    machine.index == 0
                        ? "assets/laundry_image.jpeg"
                        : "assets/dry_image.jpeg",
                    width: 120.0.r,
                    height: 120.0.r,
                  ),
                  SizedBox(height: 12.0.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${(isWoman ? index - 31 : index) + 1}번 ",
                        style: TextStyle(
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        machine.index == 0 ? "세탁기" : "건조기",
                        style: TextStyle(fontSize: 16.0.sp),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.0.h),
                  OSJStatusButton(status: status),
                ],
              ),
            ),
          );
  }
}
