import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OSJImageButton extends StatelessWidget {
  const OSJImageButton({
    super.key,
    required this.width,
    required this.height,
    required this.color,
    required this.imagePath,
    this.function,
    this.imageWidth,
    this.imageHeight,
  });

  final double width, height;
  final double? imageWidth, imageHeight;
  final Color color;
  final String imagePath;
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
          child: Image.asset(
            imagePath,
            width: imageWidth ?? 24.0.r,
            height: imageHeight ?? 24.0.r,
          ),
        ),
      ),
    );
  }
}
