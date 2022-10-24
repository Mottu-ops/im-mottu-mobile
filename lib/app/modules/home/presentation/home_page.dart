import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvelapp/app/core/extensions/screen_extension.dart';
import 'package:marvelapp/app/modules/home/presentation/home_controller.dart';
import 'package:marvelapp/app/modules/home/presentation/widgets/list_heroes_widget.dart';
import 'package:marvelapp/app/modules/home/presentation/widgets/marvel_text_field.dart';

import '../../../core/domain/entities/char_entity.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = Modular.get<HomeController>();
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(32.scale),
        child: Column(
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Showroom of ',
                    style: theme.textTheme.headline2!.merge(
                      TextStyle(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                  TextSpan(
                    text: 'Heroes',
                    style: theme.textTheme.headline2!.merge(
                      TextStyle(
                        height: 0.8,
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 24.scale),
            const MarvelTextField(),
            SizedBox(height: 32.scale),
            ListHeroes(controller: controller),
            SizedBox(height: 32.scale),
          ],
        ),
      ),
    );
  }
}
