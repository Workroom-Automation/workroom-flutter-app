import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

abstract class HiveService {
  HiveService({required this.boxName});
  final String boxName;

  Future<Box<dynamic>> _openBox() async {
    return Hive.openBox(boxName);
  }

  Future<void> writeValue<T>(String key, T value) async {
    await (await _openBox()).put(key, value);
  }

  Future<T?> readValue<T>(String key) async {
    return (await _openBox()).get(key) as T?;
  }

  Future<void> deleteValue(String key) async {
    return (await _openBox()).delete(key);
  }

  Future<void> closeBox() async {
    return (await _openBox()).close();
  }
}

@lazySingleton
class AuthHive extends HiveService {
  AuthHive() : super(boxName: 'AuthHive');
}
