import 'package:core/lotura_icons.dart';
import 'package:flutter/material.dart';

enum DeviceType {
  wash(
    text: "세탁기",
    icon: LoturaIcons.laundry,
    imagePath: "assets/laundry_image.jpeg",
  ),
  dry(
    text: "건조기",
    icon: LoturaIcons.dry,
    imagePath: "assets/dry_image.jpeg",
  );

  final String text, imagePath;
  final IconData icon;

  const DeviceType({
    required this.text,
    required this.icon,
    required this.imagePath,
  });
}
