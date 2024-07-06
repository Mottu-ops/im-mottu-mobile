import 'package:flutter/material.dart';

class NoAnimationList extends StatelessWidget {
  final Widget? child;

  const NoAnimationList({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowIndicator();
        return false;
      },
      child: child!,
    );
  }
}
