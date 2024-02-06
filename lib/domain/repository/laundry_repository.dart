import 'dart:async';

import 'package:lotura/data/dto/response/laundry_response.dart';

abstract class LaundryRepository {
  Stream<LaundryResponse> get laundryList;

  void webSocketInit();

  Future<void> setValue({required String key, required int value});

  int? getValue({required String key});
}
