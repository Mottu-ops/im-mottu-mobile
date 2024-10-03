import 'package:flutter/material.dart';

class MottuTextField extends StatelessWidget {
  MottuTextField({
    this.onChanged,
    this.onSubmitted,
  });

  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        prefix: Icon(
          Icons.search,
          color: Colors.white,
        ),
        prefixIconColor: Colors.white,
      ),
      onChanged: onChanged,
      onSubmitted: onSubmitted,
    );
  }
}
