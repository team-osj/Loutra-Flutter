import 'dart:async';

import 'package:lotura/domain/laundry/entity/laundry_entity.dart';

abstract class LaundryRepository {
  Stream<LaundryEntity> get laundryList;

  void webSocketInit();

  Future<List<LaundryEntity>> getAllLaundryList();

  Future<void> setValue({required String key, required int value});

  int? getValue({required String key});
}
