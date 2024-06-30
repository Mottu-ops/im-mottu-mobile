import 'package:flutter/material.dart';

class PersonalHorinzontalCard extends StatelessWidget {
  final String? imageUrl;
  final String? id;
  final String title;
  final String description;
  final List<Widget> widget;
  final Function()? onTap;


  const PersonalHorinzontalCard({
    super.key,
    this.imageUrl,
    this.id,
    required this.title,
    required this.description,
    this.widget = const [], required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            if (id != null) ...{
              Text(id!),
            },
            Row(
              children: [
                if (imageUrl != null) ...{
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 3 / 4,
                      child: Image.network(
                        imageUrl!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                },
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Text(title),
                      if (description.isNotEmpty) ...{
                        Text(description),
                      } else ...{
                        const Text(
                          'Top Secret!',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      },
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
