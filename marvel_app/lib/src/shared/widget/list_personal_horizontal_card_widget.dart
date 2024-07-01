import 'package:flutter/material.dart';

class ListPersonalHorizontalCar<T> extends StatelessWidget {
  final String title;
  final List<T> children;
  final Widget? Function(BuildContext, T) itemBuilder;
  const ListPersonalHorizontalCar({
    super.key,
    required this.title,
    required this.children,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: children.isNotEmpty,
      child: Column(
        children: [
          Text(title),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: children.length,
              itemBuilder: (context, i) {
               return itemBuilder(context, children[i]);
                
              },
            ),
          ),
        ],
      ),
    );
  }
}
