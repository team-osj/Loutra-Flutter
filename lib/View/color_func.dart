import 'package:flutter/material.dart';
import 'package:osj_flutter/Widget/custom_colors.dart';

Color? colorFunc(int state, int alive) {
  if (state == 0 || alive == 0) {
    return customRed;
  } else {
    return customGreen;
  }
}
