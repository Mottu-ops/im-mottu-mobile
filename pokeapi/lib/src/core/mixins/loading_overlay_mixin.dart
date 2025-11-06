import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

mixin LoadingOverlayMixin<T extends StatefulWidget> on State<T> {
  OverlayEntry? _loadingOverlay;

  void showLoading() {
    if (_loadingOverlay != null) removeLoading();

    _loadingOverlay = OverlayEntry(
      builder: (context) {
        return Material(
          color: AppColors.white.withValues(alpha: .5),
          child: const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(AppColors.red400),
            ),
          ),
        );
      },
    );

    return Overlay.of(context).insert(_loadingOverlay!);
  }

  void removeLoading() {
    if (_loadingOverlay == null) return;
    _loadingOverlay?.remove();
    _loadingOverlay = null;
  }
}
