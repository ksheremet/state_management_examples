import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:state_management_example/bloc/hydrated_bloc/counter/hydrated_counter_cubit.dart';
import 'package:state_management_example/bloc/hydrated_bloc/counter/hydrated_counter_state.dart';

class MockStorage extends Mock implements Storage {}

void main() {
  group('CounterCubit', () {
    late Storage storage;

    setUp(() {
      storage = MockStorage();
      when(
        () => storage.write(any(), any<dynamic>()),
      ).thenAnswer((_) async {});
      HydratedBloc.storage = storage;
    });

    test('initial state is HydratedCounterCubitInitial', () {
      final cubit = HydratedCounterCubit();
      expect(
        cubit.state,
        HydratedCounterCubitInitial(action: 'Initialized', count: 0),
      );
    });

    blocTest<HydratedCounterCubit, HydratedCounterCubitState>(
      'emits [1] when increment is called',
      build: () => HydratedCounterCubit(),
      act: (cubit) => cubit.increment(),
      expect: () => [
        HydratedCounterCubitIncreased(action: 'Increment', count: 1),
      ],
    );

    blocTest<HydratedCounterCubit, HydratedCounterCubitState>(
      'emits [-1] when decrement is called',
      build: () => HydratedCounterCubit(),
      act: (cubit) => cubit.decrement(),
      expect: () => [
        HydratedCounterCubitDecreased(action: 'Decrement', count: -1),
      ],
    );

    blocTest(
      'Sequence of states',
      build: () => HydratedCounterCubit(),
      act: (bloc) => bloc
        ..increment()
        ..increment()
        ..decrement(),
      expect: () => [
        HydratedCounterCubitIncreased(action: 'Increment', count: 1),
        HydratedCounterCubitIncreased(action: 'Increment', count: 2),
        HydratedCounterCubitDecreased(action: 'Decrement', count: 1),
      ],
    );

    test('toJson returns correct map', () {
      final cubit = HydratedCounterCubit();
      expect(
        cubit.toJson(HydratedCounterCubitInitial(action: 'Test', count: 5)),
        {'action': 'Test', 'count': 5},
      );
    });

    test('fromJson restores state correctly', () {
      final cubit = HydratedCounterCubit();
      final state = cubit.fromJson({'action': 'Restored', 'count': 10});
      expect(state, HydratedCounterCubitInitial(action: 'Restored', count: 10));
    });

    test('restores state from storage', () async {
      when<dynamic>(() => storage.read('HydratedCounterCubit'))
          .thenReturn({'action': 'Restored', 'count': 10});

      final cubit = HydratedCounterCubit();
      expect(cubit.state,
          HydratedCounterCubitInitial(action: 'Restored', count: 10));
    });
  });
}
