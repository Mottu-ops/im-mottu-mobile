import 'package:flutter/material.dart';
import 'package:marvel_app/src/shared/utils/functions.dart';
import 'package:marvel_app/src/shared/widget/single_item_card_widget.dart';

class ItemPersonalHorizontalCard extends StatelessWidget {
  final String? imageUrl;
  final String title;
  const ItemPersonalHorizontalCard({
    super.key,
    this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2.6,
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: AspectRatio(
              aspectRatio: 3 / 4,
              child: (imageUrl != null)
                  ? SingleItemCard(
                      backgroundImage: NetworkImage(imageUrl!),
                    )
                  : SingleItemCard(
                      backgroundImage: randomBackgroundImage().imageProvider,
                    ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                title,
                textAlign: TextAlign.justify,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
