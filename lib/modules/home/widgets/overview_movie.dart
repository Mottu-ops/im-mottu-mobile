import 'package:flutter/material.dart';
import 'package:mottu_test/core/models/marvel_model.dart';

class OverviewMovie extends StatelessWidget {
  final Results character;
  final Size size;
  const OverviewMovie({
    super.key,
    required this.character,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              character.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: size.height * 0.25,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 8.0),
                child: Text(
                  maxLines: 15,
                  character.description.toString(),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Text(
              'Stories: ${character.stories.available}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
