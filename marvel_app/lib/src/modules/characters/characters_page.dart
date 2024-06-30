import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/src/modules/characters/characters_controller.dart';
import 'package:marvel_app/src/shared/shared.dart';

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
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }
          List<CharacterData> characters = snapshot.data!;
          return ListView.separated(
            itemBuilder: (context, i) {
              final character = characters[i];
              return ListTile(
                title: Text(character.name),
                subtitle: Text(character.description),
                leading: Image.network(
                  '${character.thumbnail.path}.${character.thumbnail.extension}',
                  width: 50,
                  height: 50,
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
