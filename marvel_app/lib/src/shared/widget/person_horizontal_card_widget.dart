import 'package:flutter/material.dart';
import 'package:marvel_app/src/shared/utils/functions.dart';
import 'package:marvel_app/src/shared/widget/list_personal_horizontal_card_widget.dart';
import 'package:marvel_app/src/shared/widget/single_item_card_widget.dart';

class PersonHorizontalCard extends StatelessWidget {
  final String? imageUrl;
  final String? id;
  final String title;
  final String description;
  final List<ListPersonHorizontalCard> children;
  final Function()? onTap;

  const PersonHorizontalCard({
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
        child: SingleChildScrollView(
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
                          aspectRatio: (3 / 4) - 0.1,
                          child: SingleItemCard(
                            backgroundImage: NetworkImage(imageUrl!),
                          ),
                        ),
                      ),
                    } else ...{
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: (3 / 4) - 0.1,
                          child: SingleItemCard(
                            backgroundImage:
                                randomBackgroundImage().imageProvider,
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
                                  SelectableText(
                                    "#$id",
                                    textAlign: TextAlign.end,
                                  ),
                                ],
                              )
                            },
                            Text(
                              title,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.justify,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            if (description.isNotEmpty) ...{
                              Text(
                                description,
                                textAlign: TextAlign.justify,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                              ),
                            } else ...{
                              const Text('TOP SECRET'),
                            }
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ...children,
            ],
          ),
        ),
      ),
    );
  }
}
