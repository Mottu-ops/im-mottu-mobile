class MarvelHttpException implements Exception{

MarvelHttpException(this._statusCode, this._statusMessage, [this._data]);    
    
  final int _statusCode;
  int get statusCode => _statusCode;
  final String _statusMessage;
  String get statusMessage => _statusMessage;
  final Map<String, dynamic>?  _data;
   Map<String, dynamic>? get data => _data;

  @override
  String toString() {
    return '[$_statusCode] $_statusMessage - $_data';
  }
}