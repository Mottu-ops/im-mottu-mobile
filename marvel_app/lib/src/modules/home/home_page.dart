import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Center(
            child: Text('Marvel App'),
          ),
          TextButton.icon(
            onPressed: () {},
            label: const Text('Characters'),
          ),
          TextButton.icon(
            onPressed: () {},
            label: const Text('Comics'),
          ),
          TextButton.icon(
            onPressed: () {},
            label: const Text('Creators'),
          ),
          TextButton.icon(
            onPressed: () {},
            label: const Text('Series'),
          ),
           TextButton.icon(
            onPressed: () {},
            label: const Text('Stories'),
          ),
        ],
      ),
    );
  }
}
