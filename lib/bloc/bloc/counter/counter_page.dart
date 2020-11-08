import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_example/bloc/bloc/counter/counter_bloc.dart';

class CounterPage extends StatelessWidget {
  static const String routeName = '/counter_bloc';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Counter Bloc')),
        body: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                state.action,
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                '${state.count}',
                style: Theme.of(context).textTheme.headline3.copyWith(
                      color: Colors.black,
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: FloatingActionButton(
                backgroundColor: Colors.orange,
                heroTag: 'increment',
                child: const Icon(Icons.add),
                onPressed: () =>
                    context.read<CounterBloc>().add(IncrementEvent()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: FloatingActionButton(
                backgroundColor: Colors.teal,
                heroTag: 'decrement',
                child: const Icon(Icons.remove),
                onPressed: () =>
                    context.read<CounterBloc>().add(DecrementEvent()),
              ),
            ),
          ],
        ),
      );
}
