import 'dart:async';

import 'package:lotura/data/dto/response/laundry_response.dart';

abstract class LaundryRepository {
  Stream<List<LaundryResponse>> get laundryList;

  void init();

  Future<void> setValue<V>({required String key, required V value});

  V getValue<V>({required String key});
}
