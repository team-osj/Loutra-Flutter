import 'package:hive/hive.dart';

class LocalNoticeDataSource {
  final Box<int> _box;

  const LocalNoticeDataSource({required Box<int> box}) : _box = box;

  Future<void> setValue({required String key, required int value}) =>
      _box.put(key, value);

  int? getValue({required String key}) => _box.get(key);
}
