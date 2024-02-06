import 'dart:async';

import 'package:lotura/data/dto/response/laundry_response.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class RemoteLaundryDataSource {
  final StreamController<LaundryResponse> _streamController;
  final WebSocketChannel _channel;

  RemoteLaundryDataSource(
      {required StreamController<LaundryResponse> streamController,
      required WebSocketChannel channel})
      : _streamController = streamController,
        _channel = channel;

  Stream<LaundryResponse> get laundryList =>
      _streamController.stream.asBroadcastStream();

  void webSocketInit() {
    _channel.stream.listen((data) {
      _streamController.sink.add(LaundryResponse.fromJson(data));
    });
  }
}
