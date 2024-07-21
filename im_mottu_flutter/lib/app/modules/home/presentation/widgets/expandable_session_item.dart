import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandableSessionItem extends StatefulWidget {
  const ExpandableSessionItem({super.key, required this.title, required this.widgets});
  final List<Widget> widgets;
  final String title;

  @override
  State<ExpandableSessionItem> createState() => _ExpandableSessionItemState();
}

class _ExpandableSessionItemState extends State<ExpandableSessionItem> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Column(
      children: [
        InkWell(
          onTap: widget.widgets.isEmpty ? null : changeExpanded,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 25,
                  child: widget.widgets.isNotEmpty
                      ? Icon(
                          isExpanded ? CupertinoIcons.chevron_down : CupertinoIcons.chevron_right,
                        )
                      : const SizedBox.shrink(),
                ),
              ),
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: textTheme.titleMedium?.copyWith(color: colorScheme.onSurface, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        if (isExpanded)
          Container(
            margin: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              border: !isExpanded
                  ? null
                  : Border(
                      left: BorderSide(
                      color: colorScheme.secondaryFixed,
                    )),
            ),
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(32, 8, 0, 8),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.widgets.length,
              separatorBuilder: (context, index) => const SizedBox(
                height: 8,
              ),
              itemBuilder: (context, index) {
                final item = widget.widgets[index];
                return item;
              },
            ),
          ),
      ],
    );
  }

  changeExpanded() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }
}
