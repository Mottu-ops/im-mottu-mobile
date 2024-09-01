import 'package:flutter/material.dart';
import 'package:marvel/constants/app_colors.dart';

class DividerUI extends Divider {
  const DividerUI({
    super.key,
    super.height = 2,
    super.thickness = 1,
    super.color = AppColors.divider,
  });
}
