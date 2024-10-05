import 'dart:async';
import 'dart:io';

import 'package:analytics/analytics.dart';
import 'package:hive/hive.dart';
import 'package:persistence/src/key_value_persistence.dart';

const String CACHE_STORE_NAME = 'cache';

class HiveKeyValuePersistence<T> implements KeyValuePersistence {
  HiveKeyValuePersistence({
    required this.boxName,
    required this.directory,
    required this.analytics,
  }) {
    _initHive(boxName, directory);
  }

  final String boxName;
  final Directory directory;
  late Box<Map<String, dynamic>> box;
  final completer = Completer<Box<T>>();
  final AnalyticsService analytics;

  Future<void> _initHive(String boxName, Directory directory) async {
    final box = await Hive.openBox<T>(boxName, path: directory.path);

    if (!completer.isCompleted) {
      completer.complete(box);
    }
  }

  @override
  Future<bool> save<T>(String key, T value) async {
    try {
      final box = await completer.future as Box;
      box.put(key, value);
      return true;
    } catch (e) {
      analytics.logError(e, properties: {'operation': 'save using hive'});
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
      analytics.logError(e, properties: {'operation': 'save using hive'});
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
      analytics.logError(e, properties: {'operation': 'save using hive'});
      return false;
    }
  }

  @override
  Future<void> deleteAll() async {
    try {
      final box = await completer.future as Box;
      box.clear();
      box.close();
    } catch (e) {
      analytics.logError(e, properties: {'operation': 'save using hive'});
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
