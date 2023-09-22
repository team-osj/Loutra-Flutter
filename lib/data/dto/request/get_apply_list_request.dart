class GetApplyListRequest {
  String? token;

  GetApplyListRequest({this.token});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    return data;
  }
}
