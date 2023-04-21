import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:async';
import 'package:lotura/model/list_model.dart';

void socketInit(StreamController streamController, IO.Socket socket) async {
  socket.onConnect((data) {
    print('연결 성공');
  });
  socket.on('update', (data) {
    print(data.runtimeType.toString());
    streamController.add(OsjList.fromJson(data));
  });
  socket.onDisconnect((_) => print('disconnect'));
  socket.onConnectError((data) => print('CE : $data'));
  socket.onError((data) => print('E : $data'));
  socket.connect;
}
