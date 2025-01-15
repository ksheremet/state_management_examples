part of 'counter_bloc.dart';

@immutable
abstract class CounterState extends Equatable {
  final String action;
  final int count;

  const CounterState({required this.action, required this.count});

  @override
  List<Object> get props => [
        action,
        count,
      ];
}

class CounterInitial extends CounterState {
  const CounterInitial({required String action, required int count})
      : super(action: action, count: count);
}

class CounterIncreased extends CounterState {
  const CounterIncreased({required String action, required int count})
      : super(action: action, count: count);
}

class CounterDecreased extends CounterState {
  const CounterDecreased({required String action, required int count})
      : super(action: action, count: count);
}
