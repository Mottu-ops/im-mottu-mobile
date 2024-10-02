import 'package:mottu_marvel/modules/characters/data/models/marvel_response_model.dart';
import 'package:mottu_marvel/modules/characters/domain/repository/characters_repository.dart';
import 'package:mottu_marvel/modules/characters/domain/usecases/get_related_characters_usecase.dart';

class GetRelatedCharactersByProgramsUsecase implements GetRelatedCharactersUsecase {
  GetRelatedCharactersByProgramsUsecase({required this.repository});

  final CharactersRepository repository;

  @override
  Future<MarvelResponse> call({MarvelCharacter? param}) async {
    final comics = _buildIdList(param?.comics.items);
    final events = _buildIdList(param?.events.items);
    final series = _buildIdList(param?.series.items);

    return await repository.fetchRelatedCharacters(comics: comics, events: events, series: series, offset: 20);
  }

  List<String>? _buildIdList(List<MarvelItem>? items) {
    if (items == null) {
      return null;
    }

    return items.map((item) => _extractId(item.resourceURI)).toList();
  }

  String _extractId(String url) {
    final regex = RegExp(r'\/(\d+)$');
    final match = regex.firstMatch(url);
    return match!.group(1)!;
  }
}
