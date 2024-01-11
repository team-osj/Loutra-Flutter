import 'dart:async';

import 'package:lotura/data/data_source/laundry/local/local_laundry_data_source.dart';
import 'package:lotura/data/data_source/laundry/remote/remote_laundry_data_source.dart';
import 'package:lotura/data/dto/response/laundry_response.dart';
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
  Stream<List<LaundryResponse>> get laundryList =>
      _remoteLaundryDataSource.laundryList.asBroadcastStream();

  @override
  void init() => _remoteLaundryDataSource.init();

  @override
  int? getValue({required String key}) =>
      _localLaundryDataSource.getValue(key: key);

  @override
  Future<void> setValue({required String key, required int value}) =>
      _localLaundryDataSource.setValue(key: key, value: value);
}
