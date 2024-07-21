import 'dart:convert';
import 'dart:typed_data';

class EncryptService {
  static String md5(String input) {
    List<int> message = utf8.encode(input);
    int originalLength = message.length;

    // Step 1: Append padding bits
    message = List.from(message); // Convert to a growable list
    message.add(0x80);
    while ((message.length % 64) != 56) {
      message.add(0x00);
    }

    // Step 2: Append length (before padding)
    var lengthBytes = Uint8List(8);
    var byteData = ByteData.sublistView(lengthBytes);
    byteData.setUint64(0, originalLength * 8, Endian.little);
    message.addAll(lengthBytes);

    // Step 3: Initialize MD buffer
    int A = 0x67452301;
    int B = 0xefcdab89;
    int C = 0x98badcfe;
    int D = 0x10325476;

    // Process the message in successive 512-bit chunks:
    for (int i = 0; i < message.length; i += 64) {
      var chunk = message.sublist(i, i + 64);
      var M = List.generate(16,
          (j) => ByteData.sublistView(Uint8List.fromList(chunk.sublist(j * 4, j * 4 + 4))).getUint32(0, Endian.little));

      int AA = A;
      int BB = B;
      int CC = C;
      int DD = D;

      for (int j = 0; j < 64; j++) {
        int F, g;
        if (j < 16) {
          F = (B & C) | (~B & D);
          g = j;
        } else if (j < 32) {
          F = (D & B) | (~D & C);
          g = (5 * j + 1) % 16;
        } else if (j < 48) {
          F = B ^ C ^ D;
          g = (3 * j + 5) % 16;
        } else {
          F = C ^ (B | ~D);
          g = (7 * j) % 16;
        }

        int temp = D;
        D = C;
        C = B;
        B = B + _leftRotate((A + F + _K[j] + M[g]) & 0xffffffff, _S[j]);
        A = temp;
      }

      A = (A + AA) & 0xffffffff;
      B = (B + BB) & 0xffffffff;
      C = (C + CC) & 0xffffffff;
      D = (D + DD) & 0xffffffff;
    }

    Uint8List digest = Uint8List(16);
    ByteData.view(digest.buffer)
      ..setUint32(0, A, Endian.little)
      ..setUint32(4, B, Endian.little)
      ..setUint32(8, C, Endian.little)
      ..setUint32(12, D, Endian.little);

    return digest.map((byte) => byte.toRadixString(16).padLeft(2, '0')).join('');
  }

  static int _leftRotate(int x, int c) {
    return (x << c) | (x >> (32 - c));
  }

  static const List<int> _K = [
    0xd76aa478,
    0xe8c7b756,
    0x242070db,
    0xc1bdceee,
    0xf57c0faf,
    0x4787c62a,
    0xa8304613,
    0xfd469501,
    0x698098d8,
    0x8b44f7af,
    0xffff5bb1,
    0x895cd7be,
    0x6b901122,
    0xfd987193,
    0xa679438e,
    0x49b40821,
    0xf61e2562,
    0xc040b340,
    0x265e5a51,
    0xe9b6c7aa,
    0xd62f105d,
    0x02441453,
    0xd8a1e681,
    0xe7d3fbc8,
    0x21e1cde6,
    0xc33707d6,
    0xf4d50d87,
    0x455a14ed,
    0xa9e3e905,
    0xfcefa3f8,
    0x676f02d9,
    0x8d2a4c8a,
    0xfffa3942,
    0x8771f681,
    0x6d9d6122,
    0xfde5380c,
    0xa4beea44,
    0x4bdecfa9,
    0xf6bb4b60,
    0xbebfbc70,
    0x289b7ec6,
    0xeaa127fa,
    0xd4ef3085,
    0x04881d05,
    0xd9d4d039,
    0xe6db99e5,
    0x1fa27cf8,
    0xc4ac5665,
    0xf4292244,
    0x432aff97,
    0xab9423a7,
    0xfc93a039,
    0x655b59c3,
    0x8f0ccc92,
    0xffeff47d,
    0x85845dd1,
    0x6fa87e4f,
    0xfe2ce6e0,
    0xa3014314,
    0x4e0811a1,
    0xf7537e82,
    0xbd3af235,
    0x2ad7d2bb,
    0xeb86d391
  ];

  static const List<int> _S = [
    7,
    12,
    17,
    22,
    7,
    12,
    17,
    22,
    7,
    12,
    17,
    22,
    7,
    12,
    17,
    22,
    5,
    9,
    14,
    20,
    5,
    9,
    14,
    20,
    5,
    9,
    14,
    20,
    5,
    9,
    14,
    20,
    4,
    11,
    16,
    23,
    4,
    11,
    16,
    23,
    4,
    11,
    16,
    23,
    4,
    11,
    16,
    23,
    6,
    10,
    15,
    21,
    6,
    10,
    15,
    21,
    6,
    10,
    15,
    21,
    6,
    10,
    15,
    21
  ];
}
