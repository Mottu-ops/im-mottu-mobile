import 'package:flutter/material.dart';
import 'package:marvel_app/src/shared/widget/list_personal_horizontal_card_widget.dart';

class PersonalHorinzontalCard extends StatelessWidget {
  final String? imageUrl;
  final String? id;
  final String title;
  final String description;
  final List<ListPersonalHorizontalCar> children;
  final Function()? onTap;

  const PersonalHorinzontalCard({
    super.key,
    this.imageUrl,
    this.id,
    required this.title,
    required this.description,
    this.children = const [],
     this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: onTap,
              child: Row(
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          if (id != null) ...{
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '#$id',
                                  textAlign: TextAlign.end,
                                ),
                              ],
                            )
                          },
                          Text(
                            title,
                            textAlign: TextAlign.justify,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                          ),
                          if (description.isNotEmpty) ...{
                            Text(
                              description,
                              textAlign: TextAlign.justify,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                            ),
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
                  ),
                ],
              ),
            ),
           ...children
          ],
        ),
      ),
    );
  }
}
