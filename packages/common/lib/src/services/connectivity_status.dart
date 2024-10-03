import 'package:flutter/services.dart';

class ConnectivityStatus {
  static const EventChannel _networkStatusChannel = EventChannel('br.com.marvel.mottu/connectivity_status');

  Stream<dynamic> startConnectivityStatusService() {
    _networkStatusChannel.receiveBroadcastStream().listen((data) {
      print('STAUS CONNECT: $data');
    });
    return _networkStatusChannel.receiveBroadcastStream();
  }
}
