import 'package:flutter/material.dart';
import 'package:mottu_test/core/models/marvel_model.dart';
import 'package:mottu_test/modules/details_page/controller/details_controller.dart';

import 'package:mottu_test/modules/details_page/widgets/detail_page_view.dart';
import 'package:mottu_test/modules/details_page/widgets/loader.dart';

class DetailPage extends StatefulWidget {
  final DetailsController controller;
  final Results movie;
  const DetailPage({
    required this.movie,
    required this.controller,
    Key? key,
  });

  static const route = '/';

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    widget.controller.loader();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: widget.controller.inLoader,
        builder: (_, inLoader, __) => inLoader
            ? const LoaderDetail()
            : Center(
                child: DetailPageView(
                  movie: widget.movie,
                ),
              ),
      ),
    );
  }
}
