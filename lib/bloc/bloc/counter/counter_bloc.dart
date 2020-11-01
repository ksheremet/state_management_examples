import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial(action: 'Initialized', count: 0));

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    if (event is IncrementEvent) {
      yield CounterIncreased(action: 'Increased', count: state.count + 1);
    } else if (event is DecrementEvent) {
      yield CounterDecreased(action: 'Decreased', count: state.count - 1);
    }
  }
}
