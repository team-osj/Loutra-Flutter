import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lotura/data/dto/response/laundry_response.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class RemoteLaundryDataSource {
  final StreamController<List<LaundryResponse>> _streamController;
  final IO.Socket _socket;

  RemoteLaundryDataSource(
      {required StreamController<List<LaundryResponse>> streamController,
      required IO.Socket socket})
      : _streamController = streamController,
        _socket = socket;

  Stream<List<LaundryResponse>> get laundryList =>
      _streamController.stream.asBroadcastStream();

  void init() {
    _socket.onConnect((data) => debugPrint("연결 성공"));
    _socket.on('update', (data) {
      List<LaundryResponse> laundryList = List.empty(growable: true);
      laundryList = (data as List<dynamic>)
          .map((i) => LaundryResponse.fromJson(i))
          .toList();
      _streamController.sink.add(laundryList);
    });
  }
}
