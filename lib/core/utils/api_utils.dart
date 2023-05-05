import 'dart:convert';

import 'package:crypto/crypto.dart';

class API {
  var timeSt = DateTime.now();
  var hash;

  voidgerarHash() {
    hash = generateMd5(
        "${timeSt.toIso8601String()}a3192df28c0050da07ecc402b52177f4f6ffec6f9d0747d03b1e7c8833a018a4acd0dfe4");
  }

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }
}
