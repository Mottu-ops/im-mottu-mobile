import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marvel/core/core.dart';
import 'package:marvel/domain/entities/characters/characters_entity.dart';

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile({
    required this.stateListIndex,
    required this.descriptionIsNotEmpty,
    super.key,
  });

  final CharactersEntity stateListIndex;
  final bool descriptionIsNotEmpty;

  @override
  Widget build(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          textColor: Colors.black,
          iconColor: Colors.black,
          collapsedIconColor: Colors.black,
          collapsedTextColor: Colors.black,
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          title: Text(
            stateListIndex.name,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: Constants.poppins,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          children: [
            GestureDetector(
              onTap: () => context.pushNamed(
                RoutesEmum.details.name,
                extra: stateListIndex,
              ),
              child: SizedBox(
                width: double.infinity,
                height: 400,
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: stateListIndex.imagePath(),
                  placeholder: (context, url) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Color(0XFFED1D24),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: descriptionIsNotEmpty ? 16 : 0,
              ),
              child: descriptionIsNotEmpty
                  ? Text(
                      stateListIndex.description,
                      style: const TextStyle(
                        color: Color(0XFF666666),
                        fontFamily: Constants.poppins,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    )
                  : null,
            ),
          ],
        ),
      );
}
