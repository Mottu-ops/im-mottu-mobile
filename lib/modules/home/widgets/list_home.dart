import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mottu_test/core/themes/app_images.dart';
import 'package:mottu_test/modules/home/controller/home_getx.dart';
import 'package:mottu_test/modules/home/widgets/card_list.dart';

class ListBuilderMovies extends StatelessWidget {
  final HomeGetx controller;
  const ListBuilderMovies({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.fetchData(),
      builder: (_, snap) {
        switch (snap.connectionState) {
          case ConnectionState.done:
            return GetBuilder<HomeGetx>(
              init: controller,
              builder: (_controller) {
                return ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const Divider(),
                  shrinkWrap: true,
                  itemCount: _controller.movies.value.data.results.length,
                  itemBuilder: (_, index) {
                    return CardList(
                      comicsCharacter:
                          _controller.movies.value.data.results[index],
                    );
                  },
                );
              },
            );
          default:
            return Center(
              child: SizedBox(
                height: 600,
                child: Image.asset(AppImages.logoGif),
              ),
            );
        }
      },
    );
  }
}
