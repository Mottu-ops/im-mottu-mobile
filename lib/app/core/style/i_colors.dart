import 'package:flutter/material.dart';

abstract class IColors {
  final MaterialColor black;
  final Color white;

  final Color red;

  final Color grey;

  final Color lightGrey;

  IColors(
    this.lightGrey,
    this.black,
    this.white,
    this.red,
    this.grey,
  );
}
