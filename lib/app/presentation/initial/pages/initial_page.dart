import 'package:flutter/material.dart';
import 'package:mottu_marvel/app/core/routes/constants_routes.dart';
import 'package:mottu_marvel/app/core/theme/app_colors.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() {
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.pushNamed(context, HOME_ROUTE),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.bottomCenter,
          fit: StackFit.expand,
          children: [
            ColorFiltered(
              colorFilter: const ColorFilter.mode(
                Color.fromARGB(255, 183, 28, 28),
                BlendMode.darken,
              ),
              child: Image.asset(
                'assets/background.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'MOTTU MARVEL',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 64,
                    fontFamily: 'Marvel',
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
