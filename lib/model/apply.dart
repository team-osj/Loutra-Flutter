class Apply {
  final int deviceId;

  Apply({required this.deviceId});

  factory Apply.fromJson(Map<String, dynamic> json) {
    return Apply(
      deviceId: json['device_id'],
    );
  }
}
