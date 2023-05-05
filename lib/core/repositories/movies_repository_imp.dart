import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:mottu_test/core/models/marvel_model.dart';
import 'package:mottu_test/core/repositories/movies_repository.dart';
import 'package:mottu_test/core/services/dio_services.dart';

class MoveisImpRepo implements MovieRepository {
  final DioServices _dioService;

  MoveisImpRepo(this._dioService);
  var timeSt = DateTime.now();
  var hash;

  @override
  Future<Marvel> getMovie() async {
    gerarHash();

    final apiRequest =
        'characters?ts=${timeSt.toIso8601String()}&apikey=9d0747d03b1e7c8833a018a4acd0dfe4&hash=$hash';
    var result = await _dioService.getDio().get(apiRequest);
    return Marvel.fromJson(result.data);
  }

  gerarHash() {
    hash = generateMd5(
        "${timeSt.toIso8601String()}a3192df28c0050da07ecc402b52177f4f6ffec6f9d0747d03b1e7c8833a018a4acd0dfe4");
  }

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }
}
