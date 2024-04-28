class SendFCMInfoRequest {
  final String token;
  final int deviceId;
  final int expectState;

  const SendFCMInfoRequest({
    required this.token,
    required this.deviceId,
    required this.expectState,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['device_id'] = deviceId;
    data['expect_state'] = expectState;
    return data;
  }
}
