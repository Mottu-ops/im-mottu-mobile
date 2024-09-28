import 'package:flutter/services.dart';

enum Flavor {
  dev,
  staging,
  prod,
}

late Flavor _flavor;
Flavor get flavor => _flavor;

void setFlavor() {
  _flavor = switch (appFlavor) {
    'dev' => Flavor.dev,
    'staging' => Flavor.staging,
    'prod' => Flavor.prod,
    _ => Flavor.prod,
  };
}
