import 'package:hive/hive.dart';

class LocalLaundryDataSource {
  final Box<int> _box;

  const LocalLaundryDataSource({required Box<int> localDatabase})
      : _box = localDatabase;

  Future<void> setValue({required String key, required int value}) =>
      _box.put(key, value);

  int? getValue({required String key}) => _box.get(key);
}
