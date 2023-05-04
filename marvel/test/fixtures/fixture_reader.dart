import 'dart:io';

String fixture(String name) {
  String dir = Directory.current.path;
  if (dir.endsWith('/test')) {
    dir = dir.replaceAll('/test', '');
  }
  return File('$dir/test/fixtures/$name').readAsStringSync();
}
