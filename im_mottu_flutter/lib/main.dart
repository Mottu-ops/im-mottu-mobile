import 'package:flutter/material.dart';

import 'app/app_widget.dart';
import 'app/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  injector.commit();
  runApp(
    const AppWidget(),
  );
}
