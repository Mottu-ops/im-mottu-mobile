// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';

class Logger {
  static void info(
    dynamic error, {
    StackTrace? stackTrace,
  }) {
    if (error is String) {
      debugPrint(error.toString());
    }
    if (error?.stackTrace != null) {
      debugPrint(error?.stackTrace.toString());
    }
  }
}
