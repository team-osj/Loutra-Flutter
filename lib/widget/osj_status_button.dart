import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OSJStatusButton extends StatelessWidget {
  const OSJStatusButton({
    super.key,
    required this.text,
    required this.color,
  });

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0.w,
      height: 32.0.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: color,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14.0.sp,
          ),
        ),
      ),
    );
  }
}
