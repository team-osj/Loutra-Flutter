class Osj {
  final int id;
  final int state;
  final String deviceType;
  final int alive;

  Osj(
      {required this.id,
      required this.state,
      required this.deviceType,
      required this.alive});

  factory Osj.fromJson(Map<String, dynamic> json) {
    return Osj(
      id: json['id'],
      state: json['state'],
      deviceType: json['deviceType'],
      alive: json['alive'],
    );
  }
}