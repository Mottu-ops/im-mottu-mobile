import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:equatable/equatable.dart';

class Credentials extends Equatable {
  static const String publicKey = "276a7a7bbd71b4094ea87bc4e1682fe5";
  static const String privateKey = "49f6dcbdb7f859efa123c862802f80c5857d67ae";

  final int ts;
  final String hash;

  const Credentials({
    required this.ts,
    required this.hash,
  });

  static String generateMD5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  factory Credentials.refresh() {
    int ts = DateTime.now().millisecondsSinceEpoch;
    String input = "$ts$privateKey$publicKey";
    String hash = Credentials.generateMD5(input);
    return Credentials(ts: ts, hash: hash);
  }

  Map<String, dynamic> toJson() => {
        "ts": ts.toString(),
        "apikey": Credentials.publicKey,
        "hash": hash,
      };

  @override
  List<Object?> get props => [ts, hash];
}
