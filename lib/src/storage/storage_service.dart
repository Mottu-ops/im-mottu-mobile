import 'dart:developer';

import 'package:get_storage/get_storage.dart';

class StorageService {
  final GetStorage _storage;

  StorageService(this._storage);

  Future<void> write(String key, dynamic value) async {
    try {
      await _storage.write(key, value);
    } catch (e) {
      log('Erro ao escrever no armazenamento: $e');
    }
  }

  dynamic read(String key) {
    try {
      var value = _storage.read(key);
      return value;
    } catch (e) {
      log('Erro ao ler no armazenamento: $e');
    }
  }

  Future<void> erase() async {
    try {
      await _storage.erase();
    } catch (e) {
      log('Erro ao apagar o armazenamento: $e');
    }
  }
}
