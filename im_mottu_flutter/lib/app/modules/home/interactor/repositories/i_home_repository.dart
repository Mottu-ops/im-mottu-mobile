import '../models/character_wrapper_model.dart';

abstract class IHomeRepository {
  Future<(CharacterDataWrapper?, String errorMessage)> getCharacterListData();
}
