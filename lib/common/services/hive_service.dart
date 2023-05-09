import 'package:hive/hive.dart';

class HiveService {
  late Box<dynamic> _box;

  Future<void> openBox(String boxName) async {
    _box = await Hive.openBox(boxName);
  }

  Future<void> writeValue<T>(String key, T value) async {
    await _box.put(key, value);
  }

  T? readValue<T>(String key) {
    return _box.get(key) as T?;
  }

  Future<void> deleteValue(String key) async {
    await _box.delete(key);
  }

  Future<void> closeBox() async {
    await _box.close();
  }

  Box<dynamic> get box => _box;
}
