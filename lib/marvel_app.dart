import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MarvelApp extends StatefulWidget {
  const MarvelApp({super.key});

  @override
  State<MarvelApp> createState() => _MarvelAppState();
}

class _MarvelAppState extends State<MarvelApp> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}
