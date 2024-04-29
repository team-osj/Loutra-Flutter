import 'package:core/lotura_icons.dart';
import 'package:flutter/material.dart';

enum ButtonView {
  image,
  icon;

  Widget get triangle => this == ButtonView.image
      ? const SizedBox.shrink()
      : const Icon(LoturaIcons.triangleUp, color: Colors.grey);
}
