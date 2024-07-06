import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mottu_marvel/app/core/theme/app_colors.dart';
import 'package:mottu_marvel/app/core/theme/text_syles.dart';
import 'package:mottu_marvel/app/domain/entities/character_entity.dart';

class DetailsPageArguments {
  final CharacterEntity character;

  DetailsPageArguments({required this.character});
}

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late DetailsPageArguments pageArgs;

  @override
  Widget build(BuildContext context) {
    pageArgs =
        ModalRoute.of(context)!.settings.arguments as DetailsPageArguments;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Hero(
                      tag: pageArgs.character.name!,
                      child: CachedNetworkImage(
                        height: 64,
                        fit: BoxFit.cover,
                        imageUrl: pageArgs.character.thumbnail!.url,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    left: 12,
                    child: GestureDetector(
                      onTap: Navigator.of(context).pop,
                      child: CircleAvatar(
                        backgroundColor: AppColors.white.withOpacity(.6),
                        child: const Icon(
                          Icons.arrow_back,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 42,
                width: double.infinity,
                color: AppColors.primary,
                alignment: Alignment.center,
                child: Text(
                  pageArgs.character.name!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.h1Style.copyWith(color: AppColors.white),
                ),
              ),
              if (pageArgs.character.description?.isNotEmpty ?? false)
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    '"${pageArgs.character.description!}"',
                    textAlign: TextAlign.center,
                    style: TextStyles.h4Style.copyWith(
                      color: AppColors.grey3,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                )
              else
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Sem descrição',
                    style: TextStyles.h4Style.copyWith(color: AppColors.grey3),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
