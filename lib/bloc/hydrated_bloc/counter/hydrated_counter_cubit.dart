import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'hydrated_counter_state.dart';

class HydratedCounterCubit extends Cubit<HydratedCounterCubitState>
    with HydratedMixin {
  HydratedCounterCubit()
      : super(HydratedCounterCubitInitial(action: 'Initialized', count: 0));

  void increment() => emit(HydratedCounterCubitIncreased(
      action: 'Increment', count: state.count + 1));
  void decrement() => emit(HydratedCounterCubitDecreased(
      action: 'Decrement', count: state.count - 1));

  @override
  HydratedCounterCubitState fromJson(Map<String, dynamic> json) {
    return HydratedCounterCubitInitial(
      count: json['count'] as int,
      action: json['action'] as String,
    );
  }

  @override
  Map<String, dynamic> toJson(HydratedCounterCubitState state) => {
        'count': state.count,
        'action': state.action,
      };
}
