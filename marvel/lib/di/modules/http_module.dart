import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@module
abstract class HttpModule {
  @Named('http_module')
  @lazySingleton
  http.Client get httpClient => http.Client();
}
