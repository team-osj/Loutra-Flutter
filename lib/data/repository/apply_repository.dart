import 'dart:async';

import 'package:lotura/secret.dart';
import 'package:lotura/global/socket.dart';
import 'package:lotura/domain/model/apply_response_list.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class ApplyRepository {
  final StreamController<ApplyResponseList> _streamController;

  Stream<ApplyResponseList> get applyStream =>
      _streamController.stream.asBroadcastStream();

  ApplyRepository(this._streamController);

  Future<String> _getToken() async {
    var token = await FirebaseMessaging.instance.getToken();
    return token.toString();
  }

  void applyListRequest() {
    _getToken().then((value) => socket.emit(
          sendRequestApplyList,
          {'token': value},
        ));
  }

  void response() {
    socket.on(receiveResponseApplyList, (data) {
      _streamController.sink.add(ApplyResponseList.fromJson(data));
    });
  }

  void sendFCMInfo(int deviceId) {
    print('$deviceId번 기기 fcm 전송');
    _getToken().then((value) {
      socket.emit(sendFCM, {
        'token': value,
        'device_id': deviceId,
        'expect_state': '1',
      });
    });
  }

  void applyCancel(int deviceId) =>
      _getToken().then((value) => socket.emit(sendRequestApplyCancel, {
            'token': value,
            'device_id': deviceId,
          }));
}
