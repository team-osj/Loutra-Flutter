import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:lotura/global/socket.dart';

Future<void> sendFcmInfo(String deviceId) async {
  var token = await FirebaseMessaging.instance.getToken();
  var deviceStatus = {
    'token': token,
    'device_id': deviceId,
    'expect_state': '1',
  };
  print('$deviceId번 기기 fcm 전송');
  socket.emit('request_push', deviceStatus);
  //테스트용
  socket.on('msg', (data) {
    print('답장 : $data');
  });
}
