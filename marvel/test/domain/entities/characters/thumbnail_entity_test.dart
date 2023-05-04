import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/domain/domain.dart';

import '../../../mocks/thumbnail_mock.dart';

void main() {
  final ThumbnailEntity thumbnailEntity = ThumbnailMock.thumbnailEntity;
  test('should 3', () {
    expect(
      thumbnailEntity.props,
      [
        thumbnailEntity.path,
        thumbnailEntity.extension,
      ],
    );
  });
}
