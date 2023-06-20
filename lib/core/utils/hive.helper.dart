
import 'package:hive_flutter/hive_flutter.dart';
import '../constant/hive_keys.dart';

abstract class HiveHelper {
  static late Box _box;
  static Future<void> openBox() async {
    _box = await Hive.openBox<dynamic>(HiveKeys.authBox);
  }

  static Future<void> put({
    required String key,
    required dynamic value,
  }) async {
    if (!_box.isOpen) {
      await openBox();
    }
    return await _box.put(key, value);
  }

  static Future<void> putAll(
    Map<dynamic, dynamic> value,
  ) async {
    if (!_box.isOpen) {
      await openBox();
    }
    return await _box.putAll(value);
  }

  static Future<dynamic> get(String key) async {
    if (!_box.isOpen) {
      await openBox();
    }
    return await _box.get(key);
  }

  static Future<List<dynamic>> getAll() async {
    if (!_box.isOpen) {
      await openBox();
    }
    return _box.values.toList();
  }

  static Future<Map<dynamic, dynamic>> getBoxMap() async {
    if (!_box.isOpen) {
      await openBox();
    }

    return _box.toMap();
  }

  static Future<void> delete(String key) async {
    if (!_box.isOpen) {
      await openBox();
    }
    return await _box.delete(key);
  }

  static Future<int> clear() async {
    if (!_box.isOpen) {
      await openBox();
    }
    return await _box.clear();
  }
}
