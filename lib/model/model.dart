class Osj {
  int? id;
  int? state;
  String? deviceType;
  int? alive;

  Osj({this.id, this.state, this.deviceType, this.alive});

  Osj.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    state = json['state'];
    deviceType = json['device_type'];
    alive = json['alive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['state'] = state;
    data['device_type'] = deviceType;
    data['alive'] = alive;
    return data;
  }
}