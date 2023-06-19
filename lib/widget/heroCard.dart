import 'package:flutter/material.dart';

class HeroCard extends StatelessWidget {
  const HeroCard({super.key, this.heroName = '', required this.heroPicture});

  final String heroPicture;
  final String heroName;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.primaryColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(3, 3),
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 5
          )
        ],
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(heroPicture),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              height: 55,
              child: Text(
                heroName,
                style: TextStyle(
                  color: theme.textTheme.labelMedium?.color,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                maxLines: 3,
              ),
            ),
          )
        ],
      ),
    );
  }
}
