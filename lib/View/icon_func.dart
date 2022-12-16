import 'package:flutter/material.dart';

Icon iconFunc(String type) {
  if (type == 'WASH')
    return Icon(Icons.local_laundry_service_outlined);
  else
    return Icon(Icons.dry_cleaning);
}
