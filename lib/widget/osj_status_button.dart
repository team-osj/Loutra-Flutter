import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/main.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0.w,
      height: 32.0.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Colors.orange,
      ),
      child: Center(
        child: Text(
          map[status].toString(),
          style: TextStyle(
            fontSize: 14.0.sp,
          ),
        ),
      ),
    );
  }
}
