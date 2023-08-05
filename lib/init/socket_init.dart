import 'package:lotura/global/socket.dart';
import 'dart:async';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:lotura/domain/model/osj_list.dart';

void socketInit(StreamController streamController) async {
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
