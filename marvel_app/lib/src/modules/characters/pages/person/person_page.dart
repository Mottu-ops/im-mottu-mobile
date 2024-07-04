import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/src/modules/characters/pages/person/person_controller.dart';
import 'package:marvel_app/src/shared/shared.dart';
import 'package:marvel_app/src/shared/widget/item_personal_horizontal_card_widget.dart';
import 'package:marvel_app/src/shared/widget/list_personal_horizontal_card_widget.dart';
import 'package:marvel_app/src/shared/widget/person_horizontal_card_widget.dart';

class PersonPage extends StatefulWidget {
  final String id;
  const PersonPage({super.key, required this.id});

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  late PersonController _personController;

  @override
  void initState() {
    _personController = Modular.get<PersonController>();
    _personController.getCharacterLocal(widget.id).whenComplete(() {
      _personController.getCharacterInfoPlus(widget.id);
    });
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
            FutureBuilder(
                future: _personController.getCharacterLocal(widget.id),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: Text('Sem dados...'),
                    );
                  }
                  CharacterData character = _personController.cache!;
                  return Hero(
                    transitionOnUserGestures: true,
                    tag: character.id.toString(),
                    child: PersonHorizontalCard(
                      id: character.id.toString(),
                      title: character.name,
                      imageUrl: character.thumbnail.toString(),
                      description: character.description,
                      children: [
                        ListPersonHorizontalCard<ComicsItem>(
                          title: 'Comics',
                          children: character.comics.items,
                          listenable: _personController,
                          itemBuilder: (context, item) {
                            return ItemPersonalHorizontalCard(
                              title: item.name,
                              imageUrl: item.thumbnail?.toString(),
                            );
                          },
                        ),
                        ListPersonHorizontalCard<ComicsItem>(
                          title: 'Serie',
                          listenable: _personController,
                          children: character.series.items,
                          itemBuilder: (context, item) {
                            return ItemPersonalHorizontalCard(
                              title: item.name,
                            );
                          },
                        ),
                        ListPersonHorizontalCard<ComicsItem>(
                          title: 'Events',
                          listenable: _personController,
                          children: character.events.items,
                          itemBuilder: (context, item) {
                            return ItemPersonalHorizontalCard(
                              title: item.name,
                            );
                          },
                        ),
                        ListPersonHorizontalCard<StoriesItem>(
                          title: 'Stories',
                          listenable: _personController,
                          children: character.stories.items,
                          itemBuilder: (context, item) {
                            return ItemPersonalHorizontalCard(
                              title: item.name,
                            );
                          },
                        ),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
