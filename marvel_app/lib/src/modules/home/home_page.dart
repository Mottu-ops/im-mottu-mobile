import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:marvel_app/src/shared/widget/home_item_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Marvel App'),
        ),
        body: StaggeredGrid.count(
          crossAxisCount: 2,
          children: [
            HomeItemCard(
              label: 'A-Bomb (HAS)',
              onPressed: () {
                Modular.to.pushNamed('/characters/person/1017100');
              },
            ),
            HomeItemCard(
              label: 'Apocalypse (Ultimate)',
              onPressed: () {
                Modular.to.pushNamed('/characters/person/1011253');
              },
            ),
            HomeItemCard(
              label: 'Ant-Man (Eric O\'Grady)',
              onPressed: () {
                Modular.to.pushNamed('/characters/person/1011253');
              },
            ),
            HomeItemCard(
              label: 'Characters',
              onPressed: () {
                Modular.to.pushNamed('/characters/');
              },
            ),
            HomeItemCard(
              label: 'Comics',
              onPressed: () {},
            ),
            HomeItemCard(
              label: 'Creators',
              onPressed: () {},
            ),
            HomeItemCard(
              label: 'Series',
              onPressed: () {},
            ),
            HomeItemCard(
              label: 'Stories',
              onPressed: () {},
            ),
          ],
        ));
  }
}
