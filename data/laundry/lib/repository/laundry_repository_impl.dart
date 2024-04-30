import 'dart:async';

import 'package:laundry_data/data_source/local/local_laundry_data_source.dart';
import 'package:laundry_data/data_source/remote/remote_laundry_data_source.dart';
import 'package:laundry_data/mapper/laundry_mapper.dart';
import 'package:laundry_domain/entity/laundry_entity.dart';
import 'package:laundry_domain/repository/laundry_repository.dart';

class LaundryRepositoryImpl implements LaundryRepository {
  final LocalLaundryDataSource _localLaundryDataSource;
  final RemoteLaundryDataSource _remoteLaundryDataSource;

  const LaundryRepositoryImpl(
      {required LocalLaundryDataSource localLaundryDataSource,
      required RemoteLaundryDataSource remoteLaundryDataSource})
      : _localLaundryDataSource = localLaundryDataSource,
        _remoteLaundryDataSource = remoteLaundryDataSource;

  @override
  Stream<LaundryEntity> get laundryList => _remoteLaundryDataSource.laundryList
      .asBroadcastStream()
      .map((event) => LaundryMapper.toEntity(laundryResponse: event));

  @override
  void webSocketInit() => _remoteLaundryDataSource.webSocketInit();

  @override
  int? getValue({required String key}) =>
      _localLaundryDataSource.getValue(key: key);

  @override
  Future<void> setValue({required String key, required int value}) =>
      _localLaundryDataSource.setValue(key: key, value: value);

  @override
  Future<List<LaundryEntity>> getAllLaundryList() async {
    final laundryResponseList =
        await _remoteLaundryDataSource.getAllLaundryList();
    return laundryResponseList
        .map((e) => LaundryMapper.toEntity(laundryResponse: e))
        .toList();
  }
}
