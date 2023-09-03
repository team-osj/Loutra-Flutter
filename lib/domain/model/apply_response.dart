class ApplyResponse {
  final int deviceId;
  final String deviceType;
  final int state;

  ApplyResponse(
      {required this.deviceId, required this.deviceType, required this.state});

  factory ApplyResponse.fromJson(Map<String, dynamic> json) {
    return ApplyResponse(
      deviceId: json['device_id'],
      deviceType: json['device_type'],
      state: json['state'],
    );
  }
}
