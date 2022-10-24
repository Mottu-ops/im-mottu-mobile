import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvelapp/app/core/extensions/screen_extension.dart';
import 'package:marvelapp/app/core/style/assets.dart';
import 'dart:math' as math;

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      color: theme.primaryColor,
      child: Padding(
        padding: EdgeInsets.only(top: 64.scale),
        child: Column(
          children: [
            Text(
              'Marvel',
              style: theme.textTheme.headline1!.merge(
                TextStyle(
                  color: theme.colorScheme.background,
                ),
              ),
            ),
            Text(
              'app',
              style: theme.textTheme.headline1!.merge(
                TextStyle(
                  height: 0.8,
                  color: theme.colorScheme.secondary,
                ),
              ),
            ),
            SizedBox(
              height: 64.scale,
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (_, child) {
                return Transform.rotate(
                  angle: _controller.value * 2 * math.pi,
                  child: child,
                );
              },
              child: SvgPicture.asset(
                AssetsMarvel.shield,
                height: 100.scale,
              ),
            ),
            SizedBox(height: 24.scale),
            Text(
              'Assembling Heroes ...',
              style: theme.textTheme.headline4!.merge(
                TextStyle(
                  color: theme.colorScheme.background,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
