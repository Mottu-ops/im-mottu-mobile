import 'dart:async';

import 'package:hive/hive.dart';
import 'package:persistence/src/key_value_persistence.dart';

class HiveKeyValuePersistence<T> implements KeyValuePersistence {
  HiveKeyValuePersistence({required this.boxName}) {
    completer.complete(Hive.openBox(boxName));
  }

  final String boxName;
  final completer = Completer<Box<T>>();
  late Box<Map<String, dynamic>> box;

  @override
  Future<bool> save<T>(String key, T value) async {
    try {
      final box = await completer.future as Box<T>;
      box.put(key, value);
      return true;
    } catch (e) {
      //TODO add crashlytics
      return false;
    }
  }

  @override
  Future<T?> read<T>(String key) async {
    try {
      final box = await completer.future as Box<T>;
      return box.get(key);
    } catch (e) {
      //TODO add crashlytics
      return null;
    }
  }

  @override
  Future<bool> delete(String key) async {
    try {
      final box = await completer.future;
      await box.delete(key);
      return true;
    } catch (e) {
      //TODO add crashlytics
      return false;
    }
  }
}
