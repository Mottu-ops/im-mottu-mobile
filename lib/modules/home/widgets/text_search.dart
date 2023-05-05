import 'package:flutter/material.dart';

class TextSearch extends StatelessWidget {
  final Function(String)? onChanged;
  const TextSearch({required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          suffixIcon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          hintText: "Search",
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 20),
          hintTextDirection: TextDirection.ltr,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
