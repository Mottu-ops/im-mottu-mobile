import 'dart:convert';

import 'package:crypto/crypto.dart';

class Config {
  static String publicApiKey = "dfe62a126827f2e8e6839091b2f5ff72";
  static String privateApiKey = "5776455e35727ebef1054fde76f778f3bffd3b80";
}

var url = "http://gateway.marvel.com/v1/public/";
var timeStamp = DateTime.now();
var hash = "";

String generateUrl(String urlHash, {String limit = ""}) {
  generateHash();
  String getMarvelUrl =
      "$url$urlHash?apikey=${Config.publicApiKey}&hash=$hash&ts=${timeStamp.toIso8601String()}$limit";
  return getMarvelUrl;
}

generateHash() {
  hash = generateMd5(
  timeStamp.toIso8601String() + Config.privateApiKey + Config.publicApiKey);
}

String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}