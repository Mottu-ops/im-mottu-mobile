import 'package:flutter/cupertino.dart';

class ListPersonHorizontalCard<T> extends StatelessWidget {
  final String title;
  final List<T> children;
  final Listenable listenable;
  final Widget? Function(BuildContext, T) itemBuilder;

  const ListPersonHorizontalCard({
    super.key,
    required this.title,
    required this.children,
    required this.itemBuilder,
    required this.listenable,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: children.isNotEmpty,
      child: Column(
        children: [
          Text(
            title,
          ),
          SizedBox(
            height: 150,
            child: AnimatedBuilder(
              animation: listenable,
              builder: (context, child) => ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: children.length,
                itemBuilder: (context, i) {
                  return itemBuilder(context, children[i]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
