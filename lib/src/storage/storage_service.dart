import 'package:get_storage/get_storage.dart';

class StorageService {
  final GetStorage _storage;

  StorageService(this._storage);

  /// Escreve um valor no armazenamento usando a chave fornecida.
  Future<void> write(String key, dynamic value) async {
    try {
      await _storage.write(key, value);
      print('Valor escrito com sucesso: $key = $value');
    } catch (e) {
      print('Erro ao escrever no armazenamento: $e');
    }
  }

  /// Lê um valor do armazenamento usando a chave fornecida.
  dynamic read(String key) {
    try {
      var value = _storage.read(key);
      print('Valor lido com sucesso: $key = $value');
      return value;
    } catch (e) {
      print('Erro ao ler do armazenamento: $e');
      return null;
    }
  }

  /// Apaga todos os valores do armazenamento.
  Future<void> erase() async {
    try {
      await _storage.erase();
      print('Armazenamento apagado com sucesso.');
    } catch (e) {
      print('Erro ao apagar o armazenamento: $e');
    }
  }

  /// Inicializa o cache apenas na inicialização do aplicativo.
  Future<void> initializeCache() async {
    print('Iniciando cache');
    bool cacheCleared = _storage.read('cache_cleared') ?? false;
    print('cache_cleared: $cacheCleared');

    if (!cacheCleared) {
      print('Cache ainda não foi limpo, limpando agora.');
      await erase();
      await write('cache_cleared', true);
      print('Cache limpo e sinalização definida.');
    } else {
      print('Cache já foi limpo anteriormente.');
    }
  }
}
