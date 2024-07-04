import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/src/modules/characters/pages/characters/characters_controller.dart';
import 'package:marvel_app/src/shared/shared.dart';
import 'package:marvel_app/src/shared/widget/personal_horizontal_card_widget.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  late CharactersController _charactersController;

  @override
  void initState() {
    _charactersController = Modular.get<CharactersController>();
      _charactersController.getCharacters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Characters'),
      ),
      body: FutureBuilder<List<CharacterData>>(
        future: _charactersController.getCharacters(),
        builder: (BuildContext context, 
            AsyncSnapshot<List<CharacterData>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text('Sem dados...'),
            );
          }
          List<CharacterData> characters = snapshot.data!;
          return ListView.separated(
            itemBuilder: (context, i) {
              CharacterData character = characters[i];
              return HeroControllerScope(
                controller: HeroController(),
                child: Hero(
                  transitionOnUserGestures: true,
                  tag: character.id.toString(),
                  child: PersonalHorinzontalCard(
                    onTap: (){
                     //_charactersController.lastSelectedCharacter = character;
                     Modular.to.pushNamed('/characters/person/${character.id}');
                    },
                    id: character.id.toString(),
                    title: character.name,
                   imageUrl: character.thumbnail.toString(),
                    description: character.description,
                  ),
                ),
              );
            },
            separatorBuilder: (context, i) => const SizedBox(
              height: 12,
            ),
            itemCount: characters.length,
          );
        },
      ),
    );
  }
}
