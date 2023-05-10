import 'package:lotura/global/socket.dart';

Future<void> receiveApplyList(String token) async {
  var deviceToken = {
    'token': token,
  };
  print('리스트 받아오기');
  socket.emit('view_request', deviceToken);
  socket.on('request_list', (data) {
    print(data);
  });
}
