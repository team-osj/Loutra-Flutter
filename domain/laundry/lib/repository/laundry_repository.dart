import 'dart:async';

import 'package:laundry_data/dto/response/laundry_response.dart';

abstract interface class LaundryRepository {
  Stream<LaundryResponse> get laundryList;

  void webSocketInit();

  Future<List<LaundryResponse>> getAllLaundryList();

  Future<void> setValue({required String key, required int value});

  int? getValue({required String key});
}
