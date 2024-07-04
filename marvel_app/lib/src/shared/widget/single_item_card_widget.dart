
import 'package:flutter/material.dart';

class SingleItemCard extends StatelessWidget {
  final String? label;
  final void Function()? onPressed;
  final ImageProvider backgroundImageUrl;
  final EdgeInsets padding;
  final EdgeInsets margin;
  const SingleItemCard({
    super.key,
     this.label,
    this.onPressed,
   required this.backgroundImageUrl,
    this.padding = const EdgeInsets.all(8.0),
    this.margin = const EdgeInsets.symmetric(
      vertical: 16.0,
      horizontal: 21.0,
    ),
  });

 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: 
               backgroundImageUrl,
            
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: Colors.red,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: margin,
            child: Text(
              label ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
