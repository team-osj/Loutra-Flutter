import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:lotura/data/dto/request/apply_cancel_request.dart';
import 'package:lotura/data/dto/request/send_fcm_info_request.dart';
import 'package:lotura/data/dto/response/apply_response.dart';
import 'package:lotura/secret.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class RemoteApplyDataSource {
  final StreamController<List<ApplyResponse>> _streamController;
  final IO.Socket _socket;

  RemoteApplyDataSource(
      {required StreamController<List<ApplyResponse>> streamController,
      required IO.Socket socket})
      : _streamController = streamController,
        _socket = socket;

  Stream<List<ApplyResponse>> get applyStream =>
      _streamController.stream.asBroadcastStream();

  Future<String> _getToken() async =>
      await FirebaseMessaging.instance.getToken() ?? "whatThe";

  Future<List<ApplyResponse>> getApplyList() async {
    final response = await http.post(Uri.parse("$baseurl/push_list"),
        body: {"token": await _getToken()});
    if (response.statusCode != 200) throw Exception(response.body);
    return (jsonDecode(response.body) as List<dynamic>)
        .map((i) => ApplyResponse.fromJson(i))
        .toList();
  }

  Future<void> sendFCMInfo(
      {required SendFCMInfoRequest sendFCMInfoRequest}) async {
    sendFCMInfoRequest.token = await _getToken();
    final response = await http.post(Uri.parse("$baseurl/push_request"),
        body: sendFCMInfoRequest.toJson());
    if (response.statusCode != 200 && response.statusCode != 304) {
      throw Exception(response.body);
    }
  }

  void response() => _socket.on(receiveResponseApplyList, (data) {
        List<ApplyResponse> applyResponseList = List.empty(growable: true);
        applyResponseList = (data as List<dynamic>)
            .map((i) => ApplyResponse.fromJson(i))
            .toList();
        _streamController.sink.add(applyResponseList);
      });

  void applyCancel(ApplyCancelRequest applyCancelRequest) =>
      _getToken().then((value) {
        applyCancelRequest.token = value;
        _socket.emit(sendRequestApplyCancel, applyCancelRequest);
      });
}
