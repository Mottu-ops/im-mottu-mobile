import 'package:get/get.dart';
import 'package:im_mottu_mobile/context/characterDetail/api/character_detail_api.dart';
import 'package:im_mottu_mobile/context/characterDetail/model/character_detail_model.dart';
import 'package:im_mottu_mobile/context/home/model/comics_resume_model.dart';

class CharacterDetailController extends GetxController {
  late CharacterDetailModel character;
  List<ComicsResumeModel> comics = [];
  bool isLoading = true;
  bool isLoadingComics = true;

  @override
  void onInit() {
    super.onInit();
    int characterId = Get.arguments;
    
    fetchCharacterDetails(characterId);
  }

  void fetchCharacterDetails(int characterId) async {
    isLoading = true;
    update();
    try {
      character = await CharacterDetailApi().getCharacterDetails(characterId);
      isLoading = false;
      update();
      comics = await CharacterDetailApi().getCharacterComics(characterId);
      isLoadingComics = false;
      update();
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch character details');
    }
  }
}
