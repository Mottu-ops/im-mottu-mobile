import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/modules/ui/circular_progress_indicator_ui.dart';
import 'package:marvel/modules/ui/text_field_ui.dart';
import 'package:marvel/services/dimensions.dart';

class SearchTextFieldUI extends StatefulWidget {
  final TextEditingController controller;
  final double width;
  final double height;
  final Function(String)? onChanged;
  final bool showClear;
  final Widget? suffixIcon;
  final String hintText;
  final FocusNode? focusNode;
  final Function()? onTap;
  final bool autoFocus;
  final bool loading;

  const SearchTextFieldUI({
    super.key,
    required this.controller,
    this.width = 100,
    this.height = 35,
    this.onChanged,
    this.showClear = true,
    this.suffixIcon,
    this.hintText = "do_search_here",
    this.focusNode,
    this.onTap,
    this.autoFocus = false,
    this.loading = true,
  });

  @override
  State<SearchTextFieldUI> createState() => _SearchTextFieldUIState();
}

class _SearchTextFieldUIState extends State<SearchTextFieldUI> {
  bool _showClear = false;
  bool _loading = false;

  late TextEditingController _controller;

  @override
  void initState() {
    _controller = widget.controller;
    if (_controller.text.isNotEmpty) {
      setState(() {
        _showClear = true;
      });
    }
    _controller.addListener(listener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(listener);
    super.dispose();
  }

  void listener() {
    setState(() {
      _showClear = _controller.text.isNotEmpty;
    });
  }

  @override
  void didUpdateWidget(covariant SearchTextFieldUI oldWidget) {
    if (oldWidget.loading != widget.loading) {
      setState(() {
        _loading = widget.loading;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  Widget clearRender() => Visibility(
        visible: widget.showClear && _showClear,
        child: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () {
            _controller.text = '';
            if (widget.onChanged != null) {
              widget.onChanged!('');
            }
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: Dimensions.widthOf(context, widget.width),
      height: widget.height,
      child: TextFieldUI(
        hintText: widget.hintText.tr,
        controller: _controller,
        autoFocus: widget.autoFocus,
        prefixIcon: const Icon(
          Icons.search,
        ),
        borderRadius: 12,
        focusNode: widget.focusNode,
        onTap: widget.onTap,
        suffixIcon: Visibility(
          visible: _loading,
          replacement: clearRender(),
          child: const CircularProgressIndicatorUI(
            width: 15,
            height: 15,
          ),
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
