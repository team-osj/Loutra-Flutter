import 'package:flutter/material.dart';
import 'package:lotura_flutter/View/Widget/custom_icons.dart';

Icon iconFunc(String type, int alive) {
  if (type == 'WASH' && alive == 1) {
    return const Icon(CustomIcons.washingMachine);
  } else if (type == 'DRY' && alive == 1) {
    return const Icon(CustomIcons.tumbleDryer);
  } else {
    return const Icon(Icons.not_interested);
  }
}
