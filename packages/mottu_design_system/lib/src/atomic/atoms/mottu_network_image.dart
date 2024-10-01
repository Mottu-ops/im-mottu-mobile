import 'package:flutter/material.dart';

class MottuNetworkImage extends StatelessWidget {
  const MottuNetworkImage({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.grey.withOpacity(.7), BlendMode.softLight),
        ),
      ),
    );
  }
}
