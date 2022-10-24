import 'package:flutter/material.dart';

abstract class IColors {
  final MaterialColor black;
  final Color white;

  final Color red;

  final Color grey;

  IColors(
    this.black,
    this.white,
    this.red,
    this.grey,
  );
}
