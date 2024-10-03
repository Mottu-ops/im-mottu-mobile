class UnsupportedPlatformException implements Exception {
  UnsupportedPlatformException(this.message);

  final String message;

  @override
  String toString() => 'UnsupportedPlatformException: $message';
}
