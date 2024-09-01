import 'dart:async';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:marvel/models/credentials.dart';

class HttpBaseClient {
  final Map<String, String> _defaultHeaders = {};
  final http.Client _httpClient = http.Client();

  HttpBaseClient();

  set defaultHeaders(Map<String, String> value) {
    _defaultHeaders.addEntries(value.entries);
  }

  Map<String, String> _mergedHeaders(Map<String, String>? headers) =>
      {..._defaultHeaders, ...(headers ?? {})};

  Map<String, dynamic> get credentials => Credentials.refresh().toJson();

  Map<String, dynamic> buildQueryParameters({
    String nameStartsWith = "",
    int offset = 0,
    int limit = 20,
  }) {
    Map<String, dynamic> parameters = <String, dynamic>{};
    parameters.addIf(
        nameStartsWith.isNotEmpty, "nameStartsWith", nameStartsWith);
    parameters.addIf(offset > 0, "offset", offset.toString());
    return {
      ...parameters,
      "limit": limit.toString(),
    };
  }

  Future<http.Response> get(
    Uri url, {
    String path = "",
    String nameStartsWith = "",
    int offset = 0,
    int limit = 20,
    Map<String, String>? headers,
  }) {
    Map<String, dynamic> queryParameters = {
      ...credentials,
      ...buildQueryParameters(
        nameStartsWith: nameStartsWith,
        offset: offset,
        limit: limit,
      ),
    };
    Uri authenticatedURL =
        url.replace(path: path, queryParameters: queryParameters);
    return _httpClient.get(authenticatedURL, headers: _mergedHeaders(headers));
  }
}
