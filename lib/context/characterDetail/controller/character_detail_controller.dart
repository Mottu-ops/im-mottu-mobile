import 'package:get/get.dart';
import 'package:im_mottu_mobile/context/characterDetail/api/character_detail_api.dart';
import 'package:im_mottu_mobile/context/characterDetail/model/character_detail_model.dart';
import 'package:im_mottu_mobile/context/home/model/comics_resume_model.dart';

class CharacterDetailController extends GetxController {
  int? characterId;

  CharacterDetailModel? character;

  List<ComicsResumeModel> comics = [];

  bool isLoading = true;
  bool isLoadingComics = true;

  bool tryAgain = false;
  bool tryAgainComics = false;

  void fetchCharacterDetails() async {
    isLoading = true;
    tryAgain = false;
    update();
    try {
      character = await CharacterDetailApi().getCharacterDetails(characterId!);
      if (character == null) {
        tryAgain = true;
        update();
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch character details');
      tryAgain = true;
      update();
    } finally {
      isLoading = false;
      update();
    }
  }

  void fetchCharacterComics() async {
    isLoadingComics = true;
    tryAgainComics = false;
    update();
    try {
      comics = await CharacterDetailApi().getCharacterComics(characterId!);
      update();
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch character details');
      tryAgainComics = true;
      update();
    } finally {
      isLoadingComics = false;
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    characterId = Get.arguments;

    fetchCharacterDetails();
    fetchCharacterComics();
  }
}
