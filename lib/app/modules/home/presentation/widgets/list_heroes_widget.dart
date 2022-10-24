import 'package:flutter/material.dart';

import 'package:marvelapp/app/core/extensions/screen_extension.dart';
import 'package:marvelapp/app/modules/home/presentation/home_controller.dart';

import '../../../../core/domain/entities/char_entity.dart';

class ListHeroes extends StatelessWidget {
  final HomeController controller;
  const ListHeroes({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(height: 16.scale),
      shrinkWrap: true,
      itemCount: controller.heroes.length,
      itemBuilder: (context, index) {
        final Char char = controller.heroes[index];
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: theme.disabledColor,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.scale),
            child: Row(
              children: [
                CircleAvatar(
                  foregroundImage: NetworkImage(
                    char.imageUrl,
                  ),
                  radius: 50.scale,
                ),
                SizedBox(
                  width: 32.scale,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        char.name,
                        style: theme.textTheme.headline5!.merge(
                          TextStyle(
                            color: theme.primaryColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
