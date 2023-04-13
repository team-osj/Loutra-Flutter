import 'package:lotura_flutter/Model/model.dart';

class OsjList {
  final List<Osj>? tests;

  OsjList({this.tests});

  factory OsjList.fromJson(List<dynamic> json) {
    List<Osj> tests = <Osj>[];
    tests = json.map((i) => Osj.fromJson(i)).toList();

    return OsjList(
      tests: tests,
    );
  }
}
