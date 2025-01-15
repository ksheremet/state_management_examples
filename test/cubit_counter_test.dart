import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:state_management_example/bloc/cubit/counter/counter_cubit.dart';
import 'package:state_management_example/bloc/cubit/counter/counter_state.dart';

void main() {
  group('CounterCubit', () {
    test('initial state is CounterCubitInitial', () {
      final cubit = CounterCubit();
      expect(cubit.state, CounterCubitInitial(action: 'Initialized', count: 0));
    });

    blocTest(
      'emits [] when nothing is called',
      build: () => CounterCubit(),
      expect: () => [],
    );

    blocTest(
      'emits [1] when increment is called',
      build: () => CounterCubit(),
      act: (bloc) => bloc.increment(),
      expect: () => [CounterCubitIncreased(action: 'Increment', count: 1)],
    );

    blocTest(
      'emits [-1] when decrement is called',
      build: () => CounterCubit(),
      act: (bloc) => bloc.decrement(),
      expect: () => [CounterCubitDecreased(action: 'Decrement', count: -1)],
    );

    blocTest(
      'Sequence of states',
      build: () => CounterCubit(),
      act: (bloc) => bloc
        ..increment()
        ..increment()
        ..decrement(),
      expect: () => [
        CounterCubitIncreased(action: 'Increment', count: 1),
        CounterCubitIncreased(action: 'Increment', count: 2),
        CounterCubitDecreased(action: 'Decrement', count: 1),
      ],
    );
  });
}
