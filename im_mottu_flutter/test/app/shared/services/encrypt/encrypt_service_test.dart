import 'package:flutter_test/flutter_test.dart';
import 'package:im_mottu_flutter/app/shared/services/encrypt/encrypt_service.dart';

void main() {
  group('EncryptService.md5', () {
    test('should return correct MD5 hash for "It is a string"', () {
      final result = EncryptService.md5('It is a string');

      expect(result, '413d6668a3002baeb2c9b08cdcce4e38');
    });

    test('should return correct MD5 hash for empty string', () {
      final result = EncryptService.md5('');
      expect(result, 'd41d8cd98f00b204e9800998ecf8427e');
    });

    test('should return correct MD5 hash for "dart"', () {
      final result = EncryptService.md5('dart');
      expect(result, 'bb14127678960fae97d873950ea20156');
    });

    test('should return correct MD5 hash for a long string', () {
      final longString = 'a' * 1000;
      final result = EncryptService.md5(longString);
      expect(result, 'cabe45dcc9ae5b66ba86600cca6b8ba8');
    });
  });
}
