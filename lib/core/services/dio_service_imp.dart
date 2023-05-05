import 'package:dio/dio.dart';
import 'package:mottu_test/core/services/dio_services.dart';

class DioServicesImp implements DioServices {
  @override
  Dio getDio() {
    return Dio(
        BaseOptions(baseUrl: 'http://gateway.marvel.com/v1/public/', headers: {
      'content-type': 'application/json;charset=utf-8',
      'authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlNTE2OTFkYzBjZWEzYmM0MjkyZWVjZDdiNjhjNDY1YSIsInN1YiI6IjY0Mzk2MDYyMzdiM2E5MDExMjAyZjQ4ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KwaPG5mXQpqRWOD3FQNQgOgejr2DhCGfEK_laG4Q9CA'
    }));
  }
}
