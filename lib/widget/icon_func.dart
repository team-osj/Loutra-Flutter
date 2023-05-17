import 'package:flutter/material.dart';
import 'package:lotura/Widget/custom_icons.dart';

Icon iconFunc(String type, int alive) {
  if (type == 'WASH' && alive == 1) {
    return const Icon(CustomIcons.washingMachine);
  } else if (type == 'DRY' && alive == 1) {
    return const Icon(CustomIcons.dryer);
  } else {
    return const Icon(Icons.not_interested);
  }
}
