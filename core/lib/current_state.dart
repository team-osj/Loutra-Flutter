import 'package:core/lotura_colors.dart';
import 'package:core/lotura_icons.dart';
import 'package:flutter/material.dart';

enum CurrentState {
  working(
      icon: LoturaIcons.working,
      color: LoturaColors.primary50,
      deepColor: LoturaColors.primary700,
      deviceIconColor: LoturaColors.primary400,
      text: "작동중"),
  available(
      icon: LoturaIcons.checkCircle,
      color: LoturaColors.green50,
      deepColor: LoturaColors.green700,
      deviceIconColor: LoturaColors.green400,
      text: "사용 가능"),
  disconnected(
      icon: LoturaIcons.disconnected,
      color: LoturaColors.white,
      deepColor: LoturaColors.black,
      deviceIconColor: LoturaColors.gray400,
      text: "연결 끊김"),
  breakdown(
      icon: LoturaIcons.cancelCircle,
      color: LoturaColors.red50,
      deepColor: LoturaColors.red700,
      deviceIconColor: LoturaColors.red400,
      text: "고장");

  final IconData icon;
  final Color color, deepColor, deviceIconColor;
  final String text;

  const CurrentState({
    required this.icon,
    required this.color,
    required this.deepColor,
    required this.deviceIconColor,
    required this.text,
  });
}
