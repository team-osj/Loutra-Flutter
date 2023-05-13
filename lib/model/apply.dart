class Apply {
  final int deviceId;
  final String deviceType;

  Apply({required this.deviceId, required this.deviceType});

  factory Apply.fromJson(Map<String, dynamic> json) {
    return Apply(
      deviceId: json['device_id'],
      deviceType: json['device_type'],
    );
  }
}