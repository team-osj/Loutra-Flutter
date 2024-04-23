import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OSJTextButton extends StatelessWidget {
  const OSJTextButton(
      {super.key,
      required this.fontSize,
      required this.color,
      required this.fontColor,
      required this.text,
      this.width,
      this.height,
      this.function,
      this.radius = 16.0});

  final double? width, height;
  final double fontSize, radius;
  final Color color, fontColor;
  final String text;
  final VoidCallback? function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.symmetric(horizontal: 5.0.r),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: fontSize, color: fontColor),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
