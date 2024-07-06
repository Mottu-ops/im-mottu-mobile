import 'package:flutter/material.dart';
import 'package:mottu_marvel/app/core/theme/app_colors.dart';

class ViewModeSelector extends StatelessWidget {
  final bool isGridView;
  final Function() onToggle;

  const ViewModeSelector({
    super.key,
    required this.isGridView,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            if (!isGridView) return;
            onToggle.call();
          },
          child: Container(
            width: 80,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: isGridView ? AppColors.white : AppColors.primary,
              border: Border.all(
                width: 1,
                color: isGridView ? AppColors.primary : Colors.transparent,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                bottomLeft: Radius.circular(4),
              ),
            ),
            child: Icon(
              Icons.list,
              color: isGridView ? AppColors.primary : AppColors.white,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (isGridView) return;
            onToggle.call();
          },
          child: Container(
            width: 80,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: isGridView ? AppColors.primary : AppColors.white,
              border: Border.all(
                width: 1,
                color: isGridView ? Colors.transparent : AppColors.primary,
              ),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
            ),
            child: Icon(
              Icons.grid_view_outlined,
              color: isGridView ? AppColors.white : AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
