import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:osj_flutter/baseurl.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

Future<void> getFcm(String deviceId) async {
  var token = await FirebaseMessaging.instance.getToken();
  var deviceStatus = {
    'token': token,
    'device_id': deviceId,
    'expect_state': '1',
  };
  IO.Socket socket = IO.io(
      '$socketUrl/application',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .enableForceNewConnection()
          .disableAutoConnect()
          .build());
  socket.onConnect((data) {
    print('연결 성공');
    socket.emit('request_push', deviceStatus);
  });
  socket.on('msg', (data) {
    print('답장 : $data');
  });
  socket.onDisconnect((_) => print('disconnect'));
  socket.onConnectError((data) => print('ConnectError : $data'));
  socket.onError((data) => print('Error : $data'));
  socket.connect();
}
