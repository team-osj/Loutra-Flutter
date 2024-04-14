class ApplyCancelRequest {
  String? token;
  int deviceId;

  ApplyCancelRequest({this.token, required this.deviceId});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['device_id'] = deviceId;
    return data;
  }
}
