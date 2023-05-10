import 'package:lotura/model/apply.dart';

class ApplyList {
  final List<Apply>? applyList;

  ApplyList({this.applyList});

  factory ApplyList.fromJson(List<dynamic> json) {
    List<Apply> applyList = <Apply>[];
    applyList = json.map((i) => Apply.fromJson(i)).toList();

    return ApplyList(
      applyList: applyList,
    );
  }
}
