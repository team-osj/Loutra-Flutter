import 'package:hive/hive.dart';

class LocalLaundryDataSource {
  final Box _box;

  const LocalLaundryDataSource({required Box localDatabase})
      : _box = localDatabase;

  Future<void> setValue<V>({required String key, required V value}) =>
      _box.put(key, value);

  V getValue<V>({required String key}) => _box.get(key) as V;
}
