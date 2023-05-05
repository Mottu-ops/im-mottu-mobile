import 'package:mottu_test/core/models/marvel_model.dart';

class MarvelHelper {
  static Marvel emptyEntity() {
    return Marvel(
      attributionHTML: '',
      attributionText: '',
      code: -1,
      copyright: '',
      data: DataMarvel(offset: 1, limit: 1, total: 1, count: 1, results: []),
      etag: '',
      status: '',
    );
  }
}
