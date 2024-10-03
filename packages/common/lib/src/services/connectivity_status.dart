import 'package:flutter/services.dart';

import '../../common.dart';

class ConnectivityStatus {
  late EventChannel _networkStatusChannel;

  ConnectivityStatus() {
    _networkStatusChannel = EventChannel('br.com.marvel.mottu/connectivity_status');
  }

  Stream<dynamic> startConnectivityStatusService() {
    if (!Environment.isAndroid) {
      throw UnsupportedPlatformException('Connectivity status channel supports Android only');
    }

    return _networkStatusChannel.receiveBroadcastStream();
  }
}
