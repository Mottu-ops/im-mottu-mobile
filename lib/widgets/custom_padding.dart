import 'package:flutter/cupertino.dart';

class CustomPadding extends StatelessWidget{
  const CustomPadding({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
    child: child,);
  }

}