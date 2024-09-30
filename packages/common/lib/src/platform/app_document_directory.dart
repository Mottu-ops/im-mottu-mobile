import 'dart:io';

import 'package:path_provider/path_provider.dart';

late Directory directory;
Future<Directory> getApplicationDirectory() async {
  directory = await getApplicationDocumentsDirectory();
  return directory;
}
