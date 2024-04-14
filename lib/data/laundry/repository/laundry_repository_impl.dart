import 'dart:async';

import 'package:lotura/data/laundry/data_source/local/local_laundry_data_source.dart';
import 'package:lotura/data/laundry/data_source/remote/remote_laundry_data_source.dart';
import 'package:lotura/domain/entity/laundry_entity.dart';
import 'package:lotura/domain/repository/laundry_repository.dart';

class LaundryRepositoryImpl implements LaundryRepository {
  final LocalLaundryDataSource _localLaundryDataSource;
  final RemoteLaundryDataSource _remoteLaundryDataSource;

  LaundryRepositoryImpl(
      {required LocalLaundryDataSource localLaundryDataSource,
      required RemoteLaundryDataSource remoteLaundryDataSource})
      : _localLaundryDataSource = localLaundryDataSource,
        _remoteLaundryDataSource = remoteLaundryDataSource;

  @override
  Stream<LaundryEntity> get laundryList =>
      _remoteLaundryDataSource.laundryList.asBroadcastStream();

  @override
  void webSocketInit() => _remoteLaundryDataSource.webSocketInit();

  @override
  int? getValue({required String key}) =>
      _localLaundryDataSource.getValue(key: key);

  @override
  Future<void> setValue({required String key, required int value}) =>
      _localLaundryDataSource.setValue(key: key, value: value);

  @override
  Future<List<LaundryEntity>> getAllLaundryList() =>
      _remoteLaundryDataSource.getAllLaundryList();
}
