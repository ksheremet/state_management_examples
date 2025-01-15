import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial(action: 'Initialized', count: 0)) {
    on<IncrementEvent>((event, emit) {
      emit(CounterIncreased(action: 'Increased', count: state.count + 1));
    });

    on<DecrementEvent>((event, emit) {
      emit(CounterDecreased(action: 'Decreased', count: state.count - 1));
    });
  }
}
