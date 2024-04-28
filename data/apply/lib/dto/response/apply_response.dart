class ApplyResponse {
  final int deviceId;
  final String deviceType;

  const ApplyResponse({
    required this.deviceId,
    required this.deviceType,
  });

  factory ApplyResponse.fromJson(Map<String, dynamic> json) {
    return ApplyResponse(
      deviceId: json['device_id'],
      deviceType: json['device_type'],
    );
  }
}
