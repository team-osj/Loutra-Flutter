import 'dart:async';

import 'package:laundry_data/data_source/local/local_laundry_data_source.dart';
import 'package:laundry_data/data_source/remote/remote_laundry_data_source.dart';
import 'package:laundry_data/dto/response/laundry_response.dart';
import 'package:laundry_data/repository/laundry_repository.dart';

class LaundryRepositoryImpl implements LaundryRepository {
  final LocalLaundryDataSource _localLaundryDataSource;
  final RemoteLaundryDataSource _remoteLaundryDataSource;

  const LaundryRepositoryImpl(
      {required LocalLaundryDataSource localLaundryDataSource,
      required RemoteLaundryDataSource remoteLaundryDataSource})
      : _localLaundryDataSource = localLaundryDataSource,
        _remoteLaundryDataSource = remoteLaundryDataSource;

  @override
  Stream<LaundryResponse> get laundryList =>
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
  Future<List<LaundryResponse>> getAllLaundryList() =>
      _remoteLaundryDataSource.getAllLaundryList();
}
