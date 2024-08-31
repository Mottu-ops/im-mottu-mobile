import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef BindingCreator<S extends Bindings> = S Function();

class BindingWidgetUI<Binding extends Bindings, Controller>
    extends GetView<Controller> {
  final Widget child;
  final BindingCreator<Binding>? binding;

  const BindingWidgetUI(
      {super.key, required this.child, required this.binding});

  @override
  @nonVirtual
  Widget build(BuildContext context) {
    _createBinding();
    return child;
  }

  void _createBinding() {
    Binding? binds = binding?.call();
    binds?.dependencies();
  }
}
