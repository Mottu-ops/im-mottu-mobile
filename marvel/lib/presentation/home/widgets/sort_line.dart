import 'package:flutter/material.dart';
import 'package:marvel/core/utils/utils.dart';

class SortLine extends StatelessWidget {
  const SortLine({
    super.key,
    required this.text,
    required this.isSelected,
    required this.function,
  });

  final String text;
  final bool isSelected;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontFamily: Constants.montserrat,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
