import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokeapi/src/core/di/service_locator.dart';
import 'package:pokeapi/src/features/pokemon/presentation/ui/widgets/pokemon_card_widget.dart';

import '../../../../../core/mixins/loading_overlay_mixin.dart';
import '../../../../../core/router/app_router.dart';
import '../../notifiers/pokemon_notifier.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({super.key});

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage>
    with LoadingOverlayMixin {
  late final PokemonNotifier pokemonNotifier;

  @override
  void initState() {
    pokemonNotifier = getIt.get<PokemonNotifier>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      pokemonNotifier.addListener(pokemonListener);
      pokemonNotifier.fetchPokemons();
    });

    super.initState();
  }

  void pokemonListener() {
    final state = pokemonNotifier.value.status;
    if (state == PokemonStatus.loading) {
      showLoading();
    } else {
      removeLoading();
    }
  }

  @override
  void dispose() {
    pokemonNotifier.removeListener(pokemonListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokédex'), centerTitle: true),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: pokemonNotifier,
          builder: (context, state, child) {
            if (state.status == PokemonStatus.error) {
              return const Center(
                child: Text('Não foi possível carregar os Pokémons'),
              );
            }

            if (state.pokemons.isEmpty &&
                state.status == PokemonStatus.loaded) {
              return const Center(child: Text('Nenhum Pokémon encontrado'));
            }

            return GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 190,
                childAspectRatio: .85,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: state.pokemons.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => context.pushNamed(
                    AppRouter.paths.pokemonDetails.name,
                    extra: state.pokemons[index],
                  ),
                  child: PokemonCardWidget(pokemon: state.pokemons[index]),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
