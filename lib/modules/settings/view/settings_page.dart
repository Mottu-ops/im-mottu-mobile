import 'package:flutter/material.dart';
import 'package:mottu_test/core/themes/app_colors.dart';
import 'package:mottu_test/modules/settings/controllers/settings_controllers.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  static const route = '/';
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final SettingsController controller = SettingsController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.defaultRed,
      body: Center(
        child: GestureDetector(
          onTap: () {
            controller.logout();
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.defaultWhite,
              borderRadius: BorderRadius.circular(15),
            ),
            height: size.height * 0.06,
            width: size.width * 0.35,
            child: const Center(
              child: Text(
                'Logout',
                style: TextStyle(
                  color: AppColors.defaultBlack,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
