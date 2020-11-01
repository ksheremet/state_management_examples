import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:state_management_example/bloc/bloc/counter/counter_bloc.dart';

void main() {
  group('CounterBloc', () {
    blocTest(
      'emits [] when nothing is called',
      build: () => CounterBloc(),
      expect: [],
    );

    blocTest(
      'emits [1] when increment is called',
      build: () => CounterBloc(),
      act: (bloc) => bloc.add(IncrementEvent()),
      expect: [CounterIncreased(action: 'Increased', count: 1)],
    );

    blocTest(
      'Sequence of states',
      build: () => CounterBloc(),
      act: (bloc) => bloc
        ..add(IncrementEvent())
        ..add(IncrementEvent())
        ..add(DecrementEvent()),
      expect: [
        CounterIncreased(action: 'Increased', count: 1),
        CounterIncreased(action: 'Increased', count: 2),
        CounterDecreased(action: 'Decreased', count: 1),
      ],
    );
  });
}
