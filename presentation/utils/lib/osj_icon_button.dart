import 'package:flutter/material.dart';

class OSJIconButton extends StatelessWidget {
  const OSJIconButton(
      {super.key,
      required this.width,
      required this.height,
      required this.iconSize,
      required this.color,
      required this.iconColor,
      required this.iconData,
      this.function});

  final double width, height, iconSize;
  final Color color, iconColor;
  final IconData iconData;
  final Function? function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function != null ? () => function : null,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Center(
          child: Icon(iconData, size: iconSize, color: iconColor),
        ),
      ),
    );
  }
}
