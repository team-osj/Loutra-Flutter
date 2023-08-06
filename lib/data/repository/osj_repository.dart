import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:lotura/domain/model/osj_list.dart';
import 'package:lotura/global/socket.dart';

class OSJRepository {
  final StreamController<OsjList> _streamController;

  Stream<OsjList> get osjStream => _streamController.stream.asBroadcastStream();

  OSJRepository(this._streamController);

  void init() {
    socket.onConnect((data) => debugPrint("연결 성공"));
    socket.on(
        'update', (data) => _streamController.sink.add(OsjList.fromJson(data)));
  }
}
