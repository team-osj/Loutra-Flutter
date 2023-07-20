import 'package:flutter/material.dart';

class OSJTextButton extends StatelessWidget {
  const OSJTextButton(
      {super.key,
      required this.width,
      required this.height,
      required this.fontSize,
      required this.color,
      required this.fontColor,
      required this.text,
      this.function,
      this.radius = 16.0});

  final double width, height, fontSize, radius;
  final Color color, fontColor;
  final String text;
  final Function? function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function != null ? () => function!() : null,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: fontSize, color: fontColor),
          ),
        ),
      ),
    );
  }
}
