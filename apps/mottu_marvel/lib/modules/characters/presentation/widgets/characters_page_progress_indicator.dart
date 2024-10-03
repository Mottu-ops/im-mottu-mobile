import 'package:flutter/widgets.dart';
import 'package:mottu_design_system/mottu_design_system.dart';

class CharacterPageProgressIndicator extends StatelessWidget {
  const CharacterPageProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 40.0),
          child: MottuProgressIndicator(
            size: 30.0,
          ),
        ),
      ),
    );
  }
}
