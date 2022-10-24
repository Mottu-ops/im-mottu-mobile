// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SplashController on SplashControllerBase, Store {
  final _$stateAtom = Atom(name: 'SplashControllerBase.state');

  @override
  ControlState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ControlState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$SplashControllerBaseActionController =
      ActionController(name: 'SplashControllerBase');

  @override
  void setState(ControlState nextState) {
    final _$actionInfo = _$SplashControllerBaseActionController.startAction(
        name: 'SplashControllerBase.setState');
    try {
      return super.setState(nextState);
    } finally {
      _$SplashControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
