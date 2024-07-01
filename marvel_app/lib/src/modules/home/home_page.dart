import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton.icon(
            label: const Text('A-Bomb (HAS)'),
            onPressed: () {
              Modular.to.pushNamed('/characters/person/1017100');
            },
          ),
          TextButton.icon(
            label: const Text('Characters'),
            onPressed: () {
              Modular.to.pushNamed('/characters/');
            },
          ),
          TextButton.icon(
            label: const Text('Comics'),
            onPressed: () {},
          ),
          TextButton.icon(
            label: const Text('Creators'),
            onPressed: () {},
          ),
          TextButton.icon(
            label: const Text('Series'),
            onPressed: () {},
          ),
          TextButton.icon(
            label: const Text('Stories'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
