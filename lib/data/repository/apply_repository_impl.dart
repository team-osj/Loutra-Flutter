import 'dart:async';
import 'dart:convert';

import 'package:lotura/data/dto/response/apply_response.dart';
import 'package:lotura/secret.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:lotura/domain/repository/apply_repository.dart';

class ApplyRepositoryImpl implements ApplyRepository {
  final StreamController<List<ApplyResponse>> _streamController;

  IO.Socket socket = IO.io(
      '$baseurl/application',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .enableForceNewConnection()
          .build());

  @override
  Stream<List<ApplyResponse>> get applyStream =>
      _streamController.stream.asBroadcastStream();

  ApplyRepositoryImpl(this._streamController);

  Future<String> _getToken() async {
    var token = await FirebaseMessaging.instance.getToken();
    return token.toString();
  }

  @override
  void applyListRequest() => _getToken().then((value) => socket.emit(
        sendRequestApplyList,
        {'token': value},
      ));

  @override
  void response() => socket.on(receiveResponseApplyList, (data) {
        List<ApplyResponse> applyResponseList = List.empty(growable: true);
        applyResponseList = (data as List<dynamic>)
            .map((i) => ApplyResponse.fromJson(i))
            .toList();
        _streamController.sink.add(applyResponseList);
      });

  @override
  void sendFCMInfo(int deviceId) =>
      _getToken().then((value) => socket.emit(sendFCM, {
            'token': value,
            'device_id': deviceId,
            'expect_state': '1',
          }));

  @override
  void applyCancel(int deviceId) =>
      _getToken().then((value) => socket.emit(sendRequestApplyCancel, {
            'token': value,
            'device_id': deviceId,
          }));
}
