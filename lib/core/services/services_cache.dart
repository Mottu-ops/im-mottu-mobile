import 'package:get_storage/get_storage.dart';

class CacheService {
  final _box = GetStorage();

  Future<void> writeCache(String key, dynamic value) async {
    await _box.write(key, value);
  }

  dynamic readCache(String key) {
    return _box.read(key);
  }

  Future<void> clearCache() async {
    await _box.erase();
  }
}
