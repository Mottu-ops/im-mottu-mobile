abstract class KeyValuePersistence {
  Future<bool> save<T>(String key, T value);
  Future<T?> read<T>(String key);
  Future<bool> delete(String key);
}
