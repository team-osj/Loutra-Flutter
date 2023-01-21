import 'dart:convert';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:osj_flutter/baseurl.dart';
import 'package:osj_flutter/model/list_model.dart';

Stream<OsjList> getStatus() async* {
  IO.Socket socket = IO.io(
      '$baseurl/application',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .enableAutoConnect()
          .build());
  socket.onConnect((data) {
    print('연결 성공');
  });
  var jsonData;
  socket.on('update', (data) {
    jsonData = data;
    print('받은 데이터 : $jsonData');
  });
  socket.onDisconnect((_) => print('disconnect'));
  socket.onConnectError((data) => print('CE : $data'));
  socket.onError((data) => print('E : $data'));
  socket.connect;
  yield OsjList.fromJson(jsonDecode(jsonData));
}
