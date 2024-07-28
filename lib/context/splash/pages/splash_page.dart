import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_mottu_mobile/core/components/logo/logo.dart';
import 'package:im_mottu_mobile/core/components/text/text.dart';
import 'package:im_mottu_mobile/core/themes/app_themes.dart';
import 'package:im_mottu_mobile/routes/app_pages.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  final List<String> _imagePaths = [
    'assets/images/m1.jpg',
    'assets/images/m2.jpg',
    'assets/images/m3.jpg',
    // Adicione mais caminhos de imagem conforme necessário
  ];
  int _currentIndex = 0;
  Timer? _timer;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _fadeAnimationText;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _fadeAnimation = Tween(begin: 1.0, end: 0.0).animate(_fadeController);
    _fadeAnimationText = Tween(begin: 0.5, end: 1.0).animate(_fadeController);

    _startImageSequence();
  }

  void _startImageSequence() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _imagePaths.length;
      });
    });

    // Inicia o fade out após 2 segundos
    Future.delayed(const Duration(seconds: 1), () {
      _fadeController.forward().then((_) {
        _timer?.cancel();
        Get.offAllNamed(AppRoutes.loginPage);
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.bgPrimary,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Background image sequence
            AnimatedBuilder(
              animation: _fadeAnimation,
              builder: (context, child) {
                return Opacity(
                  opacity: _fadeAnimation.value,
                  child: Image.asset(
                    _imagePaths[_currentIndex],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                );
              },
            ),
            // Marvel styled text
            AnimatedBuilder(
              animation: _fadeAnimationText,
              builder: (context, child) {
                return Opacity(
                  opacity: _fadeAnimationText.value,
                  child: Hero(tag: "applogo", child: AppLogo.logo()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
