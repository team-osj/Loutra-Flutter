import 'dart:async';

import 'package:lotura/data/dto/request/apply_cancel_request.dart';
import 'package:lotura/data/dto/request/get_apply_list_request.dart';
import 'package:lotura/data/dto/request/send_fcm_info_request.dart';
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
  void getApplyList(GetApplyListRequest getApplyListRequest) =>
      _getToken().then((value) {
        getApplyListRequest.token = value;
        socket.emit(
          sendRequestApplyList,
          getApplyListRequest,
        );
      });

  @override
  void response() => socket.on(receiveResponseApplyList, (data) {
        List<ApplyResponse> applyResponseList = List.empty(growable: true);
        applyResponseList = (data as List<dynamic>)
            .map((i) => ApplyResponse.fromJson(i))
            .toList();
        _streamController.sink.add(applyResponseList);
      });

  @override
  void sendFCMInfo(SendFCMInfoRequest sendFCMInfoRequest) =>
      _getToken().then((value) {
        sendFCMInfoRequest.token = value;
        socket.emit(sendFCM, sendFCMInfoRequest);
      });

  @override
  void applyCancel(ApplyCancelRequest applyCancelRequest) =>
      _getToken().then((value) {
        applyCancelRequest.token = value;
        socket.emit(sendRequestApplyCancel, applyCancelRequest);
      });
}
