import 'package:uno/uno.dart';

import '../../constants/constants.dart';
import '../../errors/http_client_error.dart';
import 'http_response.dart';
import 'i_http_client.dart';
import 'typedefs.dart';

class UnoHttpClient implements IHttpClient {
  final Uno uno;

  UnoHttpClient(this.uno) {
    uno.interceptors.request.use(
      (request) async {
        return request;
      },
      onError: (error) async {
        return error;
      },
    );
    uno.interceptors.response.use(
      (p0) => p0,
      onError: (error) async {
        return error;
      },
    );
  }

  @override
  AsyncResponse delete(
    String url, {
    dynamic data,
    HttpHeadersAnotattion headers = const {},
  }) async {
    try {
      final result = await uno.delete(
        kBaseUrl + url,
        headers: headers,
        data: data,
      );

      return HttpResponse(
        statusCode: result.status,
        data: result.data,
      );
    } on UnoError catch (e) {
      throw HttpClientError(
        message: e.message,
        data: e.data,
        stackTrace: e.stackTrace,
      );
    }
  }

  @override
  AsyncResponse get(
    String url, {
    data,
    HttpHeadersAnotattion headers = const {
      'accept': 'text/plain',
      'Content-Type': 'application/json',
    },
    Map<String, String> params = const {},
  }) async {
    try {
      final result = await uno.get(
        kBaseUrl + url,
        headers: headers,
        params: params,
      );

      return HttpResponse(
        statusCode: result.status,
        data: result.data,
      );
    } on UnoError catch (e) {
      throw HttpClientError(
        message: e.message,
        data: e.data,
        stackTrace: e.stackTrace,
      );
    }
  }

  @override
  AsyncResponse patch(
    String url, {
    data,
    HttpHeadersAnotattion headers = const {
      'accept': 'text/plain',
      'Content-Type': 'application/json',
    },
  }) async {
    try {
      final result = await uno.patch(
        kBaseUrl + url,
        data: data,
        headers: headers,
      );

      return HttpResponse(
        statusCode: result.status,
        data: result.data,
      );
    } on UnoError catch (e) {
      throw HttpClientError(
        message: e.message,
        data: e.data,
        stackTrace: e.stackTrace,
      );
    }
  }

  @override
  AsyncResponse post(
    String url, {
    data,
    HttpHeadersAnotattion headers = const {
      'accept': 'text/plain',
      'Content-Type': 'application/json',
    },
  }) async {
    try {
      final result = await uno.post(
        kBaseUrl + url,
        data: data,
        headers: headers,
      );

      return HttpResponse(
        statusCode: result.status,
        data: result.data,
      );
    } on UnoError catch (e) {
      throw HttpClientError(
        message: e.message,
        data: e.response?.data,
        stackTrace: e.stackTrace,
      );
    }
  }

  @override
  AsyncResponse put(
    String url, {
    data,
    HttpHeadersAnotattion headers = const {},
  }) async {
    try {
      final result = await uno.put(
        kBaseUrl + url,
        data: data,
        headers: headers,
      );

      return HttpResponse(
        statusCode: result.status,
        data: result.data,
      );
    } on UnoError catch (e) {
      throw HttpClientError(
        message: e.message,
        data: e.data,
        stackTrace: e.stackTrace,
      );
    }
  }
}
