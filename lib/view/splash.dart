import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/controller/home.dart';
import '/view/home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  final homeController = Get.find<HomeController>();
  Duration animDuration = const Duration(seconds: 1);
  late AnimationController animController;
  late Animation<double> animation;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      double _screenHeight = MediaQuery.of(context).size.height;
      double _screenWidth = MediaQuery.of(context).size.width;
      homeController.updateScreenSize(_screenHeight, _screenWidth);
      animation = Tween(begin: homeController.screenWidth.value, end: 0.0).animate(animController);
      animController.forward();
    });
    animController = AnimationController(vsync: this, duration: animDuration)
      ..addListener(() {
        setState(() {});
      })..addStatusListener((status) {
        if(status == AnimationStatus.completed){
          Timer(animDuration, () {
            animController.reverse();
            Timer(animDuration, () {
              Get.off(() => Home());
            });
          });
        }
      });
    animation = Tween(begin: 0.0, end: 0.0).animate(animController);
    homeController.searchHeroes('');
    super.initState();
  }

  @override
  void dispose() {
    animController.dispose();
    homeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          color: const Color.fromRGBO(101, 14, 20, 1),
        ),
        Padding(
          padding: EdgeInsets.only(right: animation.value),
          child: Image.asset('assets/splash/logo-1.png', ),
        ),
        Padding(
          padding: EdgeInsets.only(left: animation.value),
          child: Image.asset('assets/splash/logo-2.png'),
        )
      ],
    );
  }
}
