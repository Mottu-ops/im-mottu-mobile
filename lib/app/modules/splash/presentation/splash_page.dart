import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvelapp/app/core/extensions/screen_extension.dart';
import 'package:marvelapp/app/core/style/assets.dart';
import 'package:marvelapp/app/modules/home/home_module.dart';
import 'dart:math' as math;

import 'package:marvelapp/app/modules/splash/presentation/controller/splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final SplashController controller = Modular.get<SplashController>();

  @override
  void initState() {
    controller.pipeline();
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
        padding: EdgeInsets.only(
          top: 64.scale,
        ),
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
            Observer(
              builder: (_) {
                if (controller.state.isSuccess) {
                  Modular.to.navigate(HomeModule.routeName);
                }
                if (controller.state.isFailure) {
                  return Padding(
                    padding: EdgeInsets.only(
                      right: 64.scale,
                      left: 64.scale,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'An Unexpected Error ocurred, please try again ...',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headline5!.merge(
                            TextStyle(
                              color: theme.colorScheme.background,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16.scale,
                        ),
                        IconButton(
                          onPressed: controller.pipeline,
                          icon: Icon(
                            Icons.replay_outlined,
                            size: 30.scale,
                            color: theme.colorScheme.background,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                if (controller.state.isLoading) {
                  return Column(
                    children: [
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
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
