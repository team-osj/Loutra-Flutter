import 'package:flutter/material.dart';
import 'package:osj_flutter/Widget/custom_colors.dart';

Color colorFunc(int state, int alive) {
  if (alive == 0) {
    return Colors.black;
  } else if (state == 0) {
    return customRed;
  } else {
    return customGreen;
  }
}
