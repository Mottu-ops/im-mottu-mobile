import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:im_mottu_flutter/app/modules/home/interactor/models/character_wrapper_model.dart';

import '../../../data.dart';

void main() {
  test('Must return a CharacterDataWrapper with a list characters when fromMap was called with success', () {
    final dataWrapper = CharacterDataWrapper.fromJson((apiResponseJson));
    expect(dataWrapper.copyright, equals('© 2024 MARVEL'));
    expect(dataWrapper.data.results.isNotEmpty, true);
  });
}
