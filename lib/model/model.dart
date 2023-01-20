class Osj {
  int? id;
  int? state;
  String? deviceType;
  int? alive;

  Osj({this.id, this.state, this.deviceType, this.alive});

  factory Osj.fromJson(Map<String, dynamic> json) {
    return Osj(
      id: json['id'],
      state: json['state'],
      deviceType: json['deviceType'],
      alive: json['alive'],
    );
  }
}
