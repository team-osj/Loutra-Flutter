class LaundryResponse {
  final int id;
  final int state;
  final String deviceType;

  LaundryResponse(
      {required this.id, required this.state, required this.deviceType});

  factory LaundryResponse.fromJson(Map<String, dynamic> json) {
    return LaundryResponse(
      id: json['id'],
      state: json['state'],
      deviceType: json['device_type'],
    );
  }
}
