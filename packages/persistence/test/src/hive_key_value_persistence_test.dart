import 'dart:io';

import 'package:analytics/analytics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';
import 'package:persistence/src/hive_key_value_persistence.dart';
import 'dart:async';

class MockBox<T> extends Mock implements Box<T> {}

class MockCompleter<T> extends Mock implements Completer<T> {}

class MockDirectory extends Mock implements Directory {}

class MockAnalyticsService extends Mock implements AnalyticsService {}

void main() {
  late MockBox<Map<String, dynamic>> mockBox;
  late HiveKeyValuePersistence persistence;
  late MockDirectory mockDirectory;
  late MockAnalyticsService analytics;

  setUp(() {
    mockDirectory = MockDirectory();
    analytics = MockAnalyticsService();
    mockBox = MockBox<Map<String, dynamic>>();

    when(() => mockDirectory.path).thenReturn('mottur/marvel/app/path');

    persistence = HiveKeyValuePersistence<Map<String, dynamic>>(
        boxName: 'testBox', directory: mockDirectory, analytics: analytics);

    if (!persistence.completer.isCompleted) {
      persistence.completer.complete(mockBox);
    }
  });

  group('HiveKeyValuePersistence Tests', () {
    test('Given a key and a value, then a new data is stored in the box', () async {
      const String cacheKey = 'cacheKey';
      const Map<String, dynamic> data = {'key': 'value'};

      when(() => mockBox.put(cacheKey, data)).thenAnswer((_) async => Future.value());

      final result = await persistence.save<Map<String, dynamic>>(cacheKey, data);

      expect(result, true);
      verify(() => mockBox.put(cacheKey, data)).called(1);
    });

    test('Given a read operation, then it should retrieve data from the box', () async {
      const String cacheKey = 'cacheKey';
      const Map<String, dynamic> storedData = {'key': 'value'};

      when(() => mockBox.get(cacheKey)).thenReturn(storedData);

      final result = await persistence.read<Map<String, dynamic>>(cacheKey);

      expect(result, isNotNull);
      expect(result, equals(storedData));
      verify(() => mockBox.get(cacheKey)).called(1);
    });

    test('Given a key and a value, when an exception occurs, it should be written in an analytics service', () async {
      const String cacheKey = 'cacheKey';
      const Map<String, dynamic> data = {'key': 'value'};

      when(() => mockBox.put(cacheKey, data)).thenThrow(Exception('error'));

      await persistence.save<Map<String, dynamic>>(cacheKey, data);

      verify(() => analytics.logError(any(), properties: any(named: 'properties'))).called(1);
    });
  });
}
