import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:osj_flutter/global/socket.dart';

Future<void> getFcm(String deviceId) async {
  var token = await FirebaseMessaging.instance.getToken();
  var deviceStatus = {
    'token': token,
    'device_id': deviceId,
    'expect_state': '1',
  };
  print('$deviceId번 기기 fcm 전송');
  socket.emit('request_push', deviceStatus);
  socket.onConnect((data) {
  });
  socket.on('msg', (data) {
    print('답장 : $data');
  });
}
