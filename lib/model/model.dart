class Osj {
  int? id;
  int? state;
  int? alive;

  Osj({this.id, this.state, this.alive});

  Osj.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    state = json['state'];
    alive = json['alive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['state'] = this.state;
    data['alive'] = this.alive;
    return data;
  }
}