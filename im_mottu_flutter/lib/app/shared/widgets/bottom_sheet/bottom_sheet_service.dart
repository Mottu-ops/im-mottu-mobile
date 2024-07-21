import 'package:flutter/material.dart';

class BottomSheetService {
  static void showCustomBottomSheet(BuildContext context, Widget widget, {int durationInMilliseconds = 500}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      transitionAnimationController: AnimationController(
        vsync: Navigator.of(context),
        duration: Duration(milliseconds: durationInMilliseconds),
      ),
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: true,
          maxChildSize: 0.95,
          minChildSize: 0.25,
          builder: (BuildContext context, ScrollController scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: widget,
            );
          },
        );
      },
    );
  }
}
