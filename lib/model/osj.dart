class Osj {
  final int id;
  final int state;
  final String deviceType;

  Osj({required this.id, required this.state, required this.deviceType});

  factory Osj.fromJson(Map<String, dynamic> json) {
    return Osj(
      id: json['id'],
      state: json['state'],
      deviceType: json['device_type'],
    );
  }
}
