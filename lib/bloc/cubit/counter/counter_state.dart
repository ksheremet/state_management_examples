import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class CounterCubitState extends Equatable {
  final String action;
  final int count;

  const CounterCubitState({this.action, this.count});

  List<Object> get props => [
        action,
        count,
      ];
}

class CounterCubitInitial extends CounterCubitState {
  const CounterCubitInitial({String action, int count})
      : super(action: action, count: count);
}

class CounterCubitIncreased extends CounterCubitState {
  const CounterCubitIncreased({String action, int count})
      : super(action: action, count: count);
}

class CounterCubitDecreased extends CounterCubitState {
  const CounterCubitDecreased({String action, int count})
      : super(action: action, count: count);
}

// Without Equitable tests will fail
// @immutable
// abstract class CounterCubitState {
//   final String action;
//   final int count;

//   const CounterCubitState({this.action, this.count});
// }

// class CounterCubitInitial extends CounterCubitState {
//   const CounterCubitInitial({String action, int count})
//       : super(action: action, count: count);
// }

// class CounterCubitIncreased extends CounterCubitState {
//   const CounterCubitIncreased({String action, int count})
//       : super(action: action, count: count);
// }

// class CounterCubitDecreased extends CounterCubitState {
//   const CounterCubitDecreased({String action, int count})
//       : super(action: action, count: count);
// }
