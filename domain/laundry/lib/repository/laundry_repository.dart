import 'dart:async';

import 'package:laundry_domain/entity/laundry_entity.dart';

abstract interface class LaundryRepository {
  Stream<LaundryEntity> get laundryList;

  void webSocketInit();

  Future<List<LaundryEntity>> getAllLaundryList();

  Future<void> setValue({required String key, required int value});

  int? getValue({required String key});
}
