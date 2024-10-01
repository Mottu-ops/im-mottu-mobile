import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({
    super.key,
    this.appBar,
    required this.body,
    this.backgroundColor,
  });

  final Widget? appBar;
  final Widget body;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            if (appBar != null) appBar!,
            Expanded(child: body),
          ],
        ),
      ),
    );
  }
}
