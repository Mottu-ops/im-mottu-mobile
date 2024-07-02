import 'package:marvel_app/src/home/models/hero_dto.dart';

abstract class ICharactersRepository {
  Future<List<HeroDto>> getHeroes();
}
