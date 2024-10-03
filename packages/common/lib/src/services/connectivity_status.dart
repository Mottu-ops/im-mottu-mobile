import 'package:flutter/services.dart';

class ConnectivityStatus {
  static const EventChannel _networkStatusChannel = EventChannel('br.com.marvel.mottu');

  Stream<String> startService() => _networkStatusChannel.receiveBroadcastStream() as Stream<String>;
}
