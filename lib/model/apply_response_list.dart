import 'package:lotura/model/apply_response.dart';

class ApplyResponseList {
  final List<ApplyResponse>? applyResponseList;

  ApplyResponseList({required this.applyResponseList});

  factory ApplyResponseList.fromJson(List<dynamic> json) {
    List<ApplyResponse> applyResponseList = <ApplyResponse>[];
    applyResponseList = json.map((i) => ApplyResponse.fromJson(i)).toList();

    return ApplyResponseList(
      applyResponseList: applyResponseList,
    );
  }
}
