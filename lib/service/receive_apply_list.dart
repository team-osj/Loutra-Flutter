import 'dart:async';
import 'package:lotura/global/socket.dart';
import 'package:lotura/model/apply_list.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


void receiveApplyList(StreamController streamController) async {
  var token = await FirebaseMessaging.instance.getToken();
  var deviceToken = {
    'token': token,
  };
  print('리스트 받아오기');
  socket.emit('view_request', deviceToken);
  socket.on('request_list', (data) {
    streamController.sink.add(ApplyList.fromJson(data));
  });
}
