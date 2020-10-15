import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_example/bloc/cubit/counter/counter_state.dart';

class CounterCubit extends Cubit<CounterCubitState> {
  CounterCubit() : super(CounterCubitInitial(action: 'Initialized', count: 0));

  void increment() =>
      emit(CounterCubitIncreased(action: 'Increment', count: state.count + 1));
  void decrement() =>
      emit(CounterCubitDecreased(action: 'Decrement', count: state.count - 1));
}
