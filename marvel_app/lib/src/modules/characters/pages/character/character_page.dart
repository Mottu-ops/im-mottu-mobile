import 'package:flutter/material.dart';



class CharacterPage extends StatefulWidget {
  final String id;
  const CharacterPage({super.key, required this.id});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Character'),
      ),
      body: Center(
        child: Text(widget.id),
      ),
    );
  }
}
