import 'dart:async';

import 'package:common/common.dart';
import 'package:hive/hive.dart';
import 'package:persistence/src/key_value_persistence.dart';

class HiveKeyValuePersistence<T> implements KeyValuePersistence {
  HiveKeyValuePersistence({required this.boxName}) {
    Hive.init(directory.path);
    completer.complete(Hive.openBox(boxName));
  }

  final String boxName;
  final completer = Completer<Box<T>>();
  late Box<Map<String, dynamic>> box;

  @override
  Future<bool> save<T>(String key, T value) async {
    try {
      final box = await completer.future as Box;
      print('DATA TO BE SAVED ON HIVE');
      print(value);
      box.put(key, value);
      return true;
    } catch (e) {
      print('ERROR WHILE SAVING');
      //TODO add crashlytics
      print(e);
      return false;
    }
  }

  @override
  Future<T?> read<T>(String key) async {
    try {
      final box = await completer.future as Box;
      final data = box.get(key);
      if (data != null && data is Map) {
        final castedData = _castNestedMap(data);
        print('DATA READ FROM HIVE');
        print(castedData);
        return castedData as T?;
      }
      return data as T?;
    } catch (e) {
      print(e);
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
      print(e);
      //TODO add crashlytics
      return false;
    }
  }

  Map<String, dynamic> _castNestedMap(Map<dynamic, dynamic> dynamicMap) {
    return dynamicMap.map((key, value) {
      if (value is Map) {
        return MapEntry(key.toString(), _castNestedMap(value));
      } else if (value is List) {
        return MapEntry(
            key.toString(),
            value.map((element) {
              if (element is Map) {
                return _castNestedMap(element);
              }
              return element;
            }).toList());
      }
      return MapEntry(key.toString(), value);
    });
  }
}
