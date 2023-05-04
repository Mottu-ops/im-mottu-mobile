import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marvel/core/core.dart';
import 'package:marvel/domain/entities/characters/characters.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({
    super.key,
    required this.charactersEntity,
  });

  final CharactersEntity charactersEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 400,
                  child: CachedNetworkImage(
                    width: 500,
                    height: 500,
                    fit: BoxFit.fill,
                    imageUrl: charactersEntity.imagePath(),
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
                Positioned(
                  left: 20,
                  top: 50,
                  child: GestureDetector(
                    onTap: () => context.pop(),
                    child: Container(
                      alignment: Alignment.center,
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Icon(Icons.arrow_back_ios_new_rounded),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(left: 24, right: 180),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0XFFFFF0DA),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                'Modified: ${charactersEntity.dateModifiedFormated()}',
                style: const TextStyle(
                  fontFamily: Constants.montserrat,
                  color: Color(0XFFB79A6F),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                charactersEntity.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: Constants.poppins,
                  color: Colors.black,
                  fontSize: 42,
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                charactersEntity.description.isNotEmpty
                    ? charactersEntity.description
                    : 'No Description',
                style: const TextStyle(
                  fontFamily: Constants.montserrat,
                  fontSize: 16,
                  color: Color(0XFF666666),
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
