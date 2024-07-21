import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_mottu_flutter/app/modules/home/interactor/states/home_state.dart';
import 'package:im_mottu_flutter/app/shared/widgets/img/marvel_logo.dart';

import '../interactor/stores/home_store.dart';
import 'widgets/character_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.homeStore});
  final HomeStore homeStore;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    widget.homeStore.getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: MarvelLogo(
          width: size.width * 0.35,
          colorFilter: colorScheme.primary,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 30),
        child: GetBuilder<HomeStore>(
            init: widget.homeStore,
            builder: (controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (controller.state.status == HomeStateStatus.loading)
                    const Center(
                      child: CircularProgressIndicator.adaptive(),
                    )
                  else if (controller.state.status == HomeStateStatus.error)
                    Center(
                      child: Text(controller.state.errorMessage),
                    )
                  else if (controller.state.charactersList.isEmpty)
                    const Center(
                      child: Text('Characters not found'),
                    )
                  else
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 6 / 7,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                        itemCount: controller.state.charactersList.length,
                        itemBuilder: (context, index) {
                          final item = controller.state.charactersList[index];
                          return CharacterCardWidget(
                            item: item,
                          );
                        },
                      ),
                    ),
                ],
              );
            }),
      ),
    );
  }
}
