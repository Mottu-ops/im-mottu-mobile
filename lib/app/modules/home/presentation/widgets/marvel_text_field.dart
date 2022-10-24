import 'package:flutter/material.dart';
import 'package:marvelapp/app/core/extensions/screen_extension.dart';

import '../../../../core/style/fonts.dart';

class MarvelTextField extends StatelessWidget {
  const MarvelTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 24.scale),
        child: TextField(
          style: TextStyle(
            fontFamily: FontsMarvel.quicksand,
            color: theme.colorScheme.secondary,
          ),
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {},
                  icon: Icon(
                    Icons.filter_list,
                    color: theme.colorScheme.secondary,
                  ),
                ),
                IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                  ),
                ),
              ],
            ),
            hintText: 'Enter hero name',
            hintStyle: TextStyle(
              fontFamily: FontsMarvel.quicksand,
              color: theme.dividerColor,
            ),
          ),
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.primary),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
