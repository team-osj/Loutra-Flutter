import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:osj_flutter/baseurl.dart';


IO.Socket socket = IO.io(
    '$baseurl/application',
    IO.OptionBuilder()
        .setTransports(['websocket'])
        .enableForceNewConnection()
        .disableAutoConnect()
        .build());