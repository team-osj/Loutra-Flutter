import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/main.dart';
import 'package:lotura/widget/custom_colors.dart';

class OSJStatusButton extends StatelessWidget {
  OSJStatusButton({
    super.key,
    required this.status,
  });

  final Status status;

  Map map = <Status, String>{
    Status.available: "사용 가능",
    Status.working: "작동중",
    Status.breakdown: "고장",
  };

  final Map statusColor = <Status, Color>{
    Status.available: OsjColor.green100,
    Status.working: OsjColor.primary100,
    Status.breakdown: OsjColor.red100,
  };

  final Map statusTextColor = <Status, Color>{
    Status.available: OsjColor.green700,
    Status.working: OsjColor.primary700,
    Status.breakdown: OsjColor.red700,
  };


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0.w,
      height: 32.0.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: statusColor[status],
      ),
      child: Center(
        child: Text(
          map[status].toString(),
          style: TextStyle(
            color: statusTextColor[status],
            fontSize: 14.0.sp,
          ),
        ),
      ),
    );
  }
}
