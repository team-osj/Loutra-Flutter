import 'dart:async';

import 'package:lotura/secret.dart';
import 'package:flutter/cupertino.dart';
import 'package:lotura/domain/model/osj_list.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:lotura/domain/repository/laundry_repository.dart';

class LaundryRepositoryImpl implements LaundryRepository {
  final StreamController<OsjList> _streamController;

  IO.Socket socket = IO.io(
      '$baseurl/application',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .enableForceNewConnection()
          .build());

  @override
  Stream<OsjList> get osjStream => _streamController.stream.asBroadcastStream();

  LaundryRepositoryImpl(this._streamController);

  @override
  void init() {
    socket.onConnect((data) => debugPrint("연결 성공"));
    socket.on(
        'update', (data) => _streamController.sink.add(OsjList.fromJson(data)));
  }
}
