import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:mottu_test/core/themes/app_colors.dart';
import 'package:mottu_test/modules/home/controller/home_getx.dart';
import 'package:mottu_test/modules/home/home_module.dart';

class BottomMovie extends StatelessWidget {
  const BottomMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 70,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: AppColors.defaultBlack.withOpacity(0.8),
          borderRadius: const BorderRadius.all(Radius.circular(50)),
        ),
        child: GetBuilder<HomeGetx>(
            init: HomeGetx(),
            builder: (_) {
              return BottomNavigationBar(
                backgroundColor: Colors.transparent,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Settings',
                  ),
                ],
                currentIndex: _.selectIndex.value,
                selectedItemColor: AppColors.defaultRed,
                onTap: (int index) {
                  switch (index) {
                    case 0:
                      Modular.to.navigate('.${HomeModule.list}');
                      _.updateIndex(index);
                      break;
                    case 1:
                      Modular.to.navigate('.${HomeModule.settings}');
                      _.updateIndex(index);
                      break;

                    default:
                  }
                },
              );
            }),
      ),
    );
  }
}
