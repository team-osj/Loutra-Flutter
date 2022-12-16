import 'package:flutter/material.dart';

Icon iconFunc(String type) {
  if (type == 'WASH') {
    return const Icon(Icons.local_laundry_service_outlined);
  } else {
    return const Icon(Icons.dry_cleaning);
  }
}
