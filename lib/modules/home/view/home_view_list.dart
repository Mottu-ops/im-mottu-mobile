import 'package:flutter/material.dart';
import 'package:mottu_test/core/themes/app_colors.dart';
import 'package:mottu_test/modules/home/controller/home_getx.dart';
import 'package:mottu_test/modules/home/widgets/list_home.dart';
import 'package:mottu_test/modules/home/widgets/text_search.dart';

class HomeListView extends StatefulWidget {
  const HomeListView({super.key});

  @override
  State<HomeListView> createState() => _HomeListViewState();
}

class _HomeListViewState extends State<HomeListView> {
  final HomeGetx _controller = HomeGetx();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultRed,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 70,
                child: Padding(
                  padding: EdgeInsets.only(top: 10.0, right: 8.0),
                ),
              ),
              const Text(
                "MARVEL",
                style: TextStyle(
                  fontSize: 65,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "COMICS",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ListBuilderMovies(controller: _controller),
            ],
          ),
        ),
      ),
    );
  }
}
