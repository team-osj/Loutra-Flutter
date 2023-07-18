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
      required this.function});

  final double width, height, fontSize;
  final Color color, fontColor;
  final String text;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => function,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16.0),
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
