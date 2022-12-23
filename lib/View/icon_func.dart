import 'package:flutter/material.dart';
import 'package:osj_flutter/Widget/custom_icons.dart';

Icon iconFunc(String type) {
  if (type == 'WASH') {
    return const Icon(CustomIcons.washingMachine);
  } else {
    return const Icon(CustomIcons.tumbleDryer);
  }
}
