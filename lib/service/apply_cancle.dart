import 'dart:async';
import 'package:lotura/global/socket.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:lotura/model/apply_response_list.dart';

void applyCancle(StreamController controller, int id) async {
  var token = await FirebaseMessaging.instance.getToken();
  var cancelRequestBody = {'token': token, 'device_id': id};
  print('리스트 받아오기');
  socket.emit('remove_request', cancelRequestBody);
  socket.on('request_list', (data) {
    controller.sink.add(ApplyResponseList.fromJson(data));
  });
}
