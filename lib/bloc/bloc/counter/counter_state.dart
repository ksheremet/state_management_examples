part of 'counter_bloc.dart';

@immutable
abstract class CounterState extends Equatable {
  final String action;
  final int count;

  const CounterState({this.action, this.count});

  @override
  List<Object> get props => [
        action,
        count,
      ];
}

class CounterInitial extends CounterState {
  const CounterInitial({String action, int count})
      : super(action: action, count: count);
}

class CounterIncreased extends CounterState {
  const CounterIncreased({String action, int count})
      : super(action: action, count: count);
}

class CounterDecreased extends CounterState {
  const CounterDecreased({String action, int count})
      : super(action: action, count: count);
}
