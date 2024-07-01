import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/src/modules/characters/pages/person/person_controller.dart';
import 'package:marvel_app/src/shared/shared.dart';
import 'package:marvel_app/src/shared/widget/personal_horizontal_card_widget.dart';

class PersonPage extends StatefulWidget {
  final String id;
  const PersonPage({super.key, required this.id});

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  late PersonController _charactersController;
  late CharacterData character;

  @override
  void initState() {
    _charactersController = Modular.get<PersonController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(' Character'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              PersonalHorinzontalCard(
                onTap: () {
                  _charactersController.lastSelectedCharacter = character;
                  Modular.to.pushNamed('/characters/person/${character.id}');
                },
                id: character.id.toString(),
                title: character.name,
                imageUrl: character.thumbnail.toString(),
                description: character.description,
              ),
            ],
          ),
        ));
  }
}
