import 'package:flutter/material.dart';

class OSJIconButton extends StatelessWidget {
  const OSJIconButton(
      {super.key,
      required this.width,
      required this.height,
      required this.iconSize,
      required this.color,
      required this.iconData,
      required this.function});

  final double width, height, iconSize;
  final Color color;
  final IconData iconData;
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
          child: Icon(iconData, size: iconSize),
        ),
      ),
    );
  }
}
