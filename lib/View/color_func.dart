import 'package:flutter/material.dart';
import 'package:osj_flutter/Widget/custom_colors.dart';

Color? colorFunc(int state) {
  if (state == 0) {
    return customRed;
  } else {
    return customGreen;
  }
}
