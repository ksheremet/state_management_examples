import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class HydratedCounterCubitState extends Equatable {
  final String action;
  final int count;

  const HydratedCounterCubitState({required this.action, required this.count});

  @override
  List<Object> get props => [
        action,
        count,
      ];
}

class HydratedCounterCubitInitial extends HydratedCounterCubitState {
  const HydratedCounterCubitInitial(
      {required String action, required int count})
      : super(action: action, count: count);
}

class HydratedCounterCubitIncreased extends HydratedCounterCubitState {
  const HydratedCounterCubitIncreased(
      {required String action, required int count})
      : super(action: action, count: count);
}

class HydratedCounterCubitDecreased extends HydratedCounterCubitState {
  const HydratedCounterCubitDecreased(
      {required String action, required int count})
      : super(action: action, count: count);
}
