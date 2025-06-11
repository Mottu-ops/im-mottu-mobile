import 'package:flutter/material.dart';
import 'package:pokeapp_mottu/models/pokemon.dart';
import 'package:pokeapp_mottu/controllers/pokemon_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PokemonController _controller = PokemonController();
  late Future<List<Pokemon>> _pokeList;

  @override
  void initState() {
    super.initState();
    _pokeList = _controller.fetchPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PokeAPI - Mottu')),
      body: FutureBuilder<List<Pokemon>>(
        future: _pokeList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final pokemons = snapshot.data!;
            return ListView.builder(
              itemCount: pokemons.length,
              itemBuilder: (context, index){
                final pokemon = pokemons[index];
                return ListTile(
                  leading: CachedNetworkImage(imageUrl: pokemon.imageUrl),
                  title: Text(pokemon.name),
                  onTap: (){
                    //TODO: CRIAR TELA DE DETALHE E CHAMAR ELA AQUI.
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
          return Center(child: Text('Erro: ${snapshot.error}'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
