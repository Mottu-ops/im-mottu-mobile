import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScaffoldExtendBodyUI extends Scaffold {
  ScaffoldExtendBodyUI({
    super.key,
    super.body,
    super.floatingActionButtonLocation,
    super.floatingActionButton,
    super.backgroundColor,
    appBar,
  }) : super(
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              systemNavigationBarColor: Colors.transparent,
              systemNavigationBarDividerColor: Colors.transparent,
            ),
            backgroundColor: Colors.transparent,
            excludeHeaderSemantics: true,
            elevation: 0,
            automaticallyImplyLeading: false,
          ),
        );
}
