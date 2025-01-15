import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:state_management_example/bloc/bloc/counter/counter_bloc.dart';

void main() {
  group('CounterBloc', () {
    test('initial state is CounterCubitInitial', () {
      final cubit = CounterBloc();
      expect(cubit.state, CounterInitial(action: 'Initialized', count: 0));
    });

    blocTest(
      'emits [] when nothing is called',
      build: () => CounterBloc(),
      expect: () => [],
    );

    blocTest(
      'emits [1] when increment is called',
      build: () => CounterBloc(),
      act: (bloc) => bloc.add(IncrementEvent()),
      expect: () => [CounterIncreased(action: 'Increased', count: 1)],
    );

    blocTest(
      'emits [-1] when decrement is called',
      build: () => CounterBloc(),
      act: (bloc) => bloc.add(DecrementEvent()),
      expect: () => [CounterDecreased(action: 'Decreased', count: -1)],
    );

    blocTest(
      'Sequence of states',
      build: () => CounterBloc(),
      act: (bloc) => bloc
        ..add(IncrementEvent())
        ..add(IncrementEvent())
        ..add(DecrementEvent()),
      expect: () => [
        CounterIncreased(action: 'Increased', count: 1),
        CounterIncreased(action: 'Increased', count: 2),
        CounterDecreased(action: 'Decreased', count: 1),
      ],
    );
  });
}
