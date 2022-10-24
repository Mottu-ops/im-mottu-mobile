import 'package:equatable/equatable.dart';

class ControlState extends Equatable {
  const ControlState();

  @override
  List<Object?> get props => [];

  static ControlState get start => StartState();
  static ControlState get empty => EmptyState();
  static ControlState get loading => LoadingState();
  static ControlState get success => SuccessState();
  static ControlState get failure => ErrorState();

  bool get isStart => this is StartState;
  bool get isEmpty => this is EmptyState;
  bool get isLoading => this is LoadingState;
  bool get isSuccess => this is SuccessState;
  bool get isFailure => this is ErrorState;
}

class StartState extends ControlState {}

class SuccessState extends ControlState {}

class LoadingState extends ControlState {}

class ErrorState extends ControlState {}

class EmptyState extends ControlState {}
