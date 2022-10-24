import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:marvelapp/app/core/data/datasources/i_remote_datasource.dart';
import 'package:marvelapp/app/core/data/models/char_model.dart';
import 'package:marvelapp/app/core/error/exceptions.dart';
import 'package:marvelapp/app/core/network/keys.dart';
import 'package:marvelapp/app/core/network/uri.dart';
import 'package:crypto/crypto.dart' as crypto;

class RemoteDatasource implements IRemoteDatasource {
  final Dio _dio;
  RemoteDatasource({
    required Dio dio,
  }) : _dio = dio;
  @override
  Future<List<CharModel>> getHeroes() async {
    try {
      final date = DateTime.now().millisecondsSinceEpoch.toString();
      final bytes = utf8.encode(
        date + ApiKey.privateKey + ApiKey.publicKey,
      );
      final result = await _dio.get(
        URI.characters,
        queryParameters: {
          'apikey': ApiKey.publicKey,
          'ts': date,
          'hash': crypto.md5.convert(bytes)
        },
      );
      final data = result.data['data']['results'];
      return List<CharModel>.generate(
        data.length,
        (index) {
          return CharModel.fromMap(data[index]);
        },
      );
    } catch (_) {
      throw InternetException(
        message: 'Server Error',
      );
    }
  }
}
