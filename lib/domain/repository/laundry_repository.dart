import 'dart:async';
import 'package:lotura/domain/model/osj_list.dart';

abstract class LaundryRepository {
  final StreamController<OsjList> _streamController;

  LaundryRepository(this._streamController);

  Stream<OsjList> get osjStream;

  void init();
}
