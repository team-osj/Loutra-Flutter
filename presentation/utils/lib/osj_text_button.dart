import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      this.padding = EdgeInsets.zero,
      this.radius = 16.0});

  final double? width, height;
  final double fontSize, radius;
  final Color color, fontColor;
  final String text;
  final VoidCallback? function;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: width,
        height: height,
        padding: padding,
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
