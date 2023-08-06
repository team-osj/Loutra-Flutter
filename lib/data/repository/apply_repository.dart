import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:lotura/secret.dart';
import 'package:lotura/domain/model/apply_response_list.dart';
import 'package:lotura/global/socket.dart';

class ApplyRepository {
  final StreamController<ApplyResponseList> _streamController;

  Stream<ApplyResponseList> get applyStream =>
      _streamController.stream.asBroadcastStream();

  ApplyRepository(this._streamController);

  Future<Map<String, String>> _getToken() async {
    var token = await FirebaseMessaging.instance.getToken();
    var deviceToken = {'token': token.toString()};
    return deviceToken;
  }

  void init() {
    _getToken().then((value) => socket.emit(sendRequestApplyList, value));
    socket.on(receiveResponseApplyList,
        (data) => _streamController.add(ApplyResponseList.fromJson(data)));
  }
}
