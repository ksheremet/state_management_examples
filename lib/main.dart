import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:state_management_example/bloc/cubit/counter/counter_cubit.dart';
import 'package:state_management_example/bloc/cubit/counter/counter_cubit_page.dart';
import 'package:state_management_example/bloc/hydrated_bloc/counter/hydrated_counter_cubit.dart';
import 'package:state_management_example/bloc/hydrated_bloc/counter/hydrated_counter_cubit_page.dart';

import 'bloc/bloc/counter/counter_bloc.dart';
import 'bloc/bloc/counter/counter_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Storage for Hydrated Cubit
  HydratedCubit.storage = await HydratedStorage.build();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: MyHomePage(title: 'Flutter Bloc State Management'),
        initialRoute: MyHomePage.routeName,
        routes: {
          CounterCubitPage.routeName: (context) => CounterCubitPage(),
          CounterPage.routeName: (context) => CounterPage(),
          HydratedCounterCubitPage.routeName: (context) =>
              HydratedCounterCubitPage(),
        },
        builder: (context, child) => MultiBlocProvider(providers: [
          BlocProvider<CounterCubit>(
            lazy: true,
            create: (context) => CounterCubit(),
          ),
          BlocProvider(
            lazy: true,
            create: (context) => CounterBloc(),
          ),
          BlocProvider(
            lazy: true,
            create: (context) => HydratedCounterCubit(),
          )
        ], child: child),
      );
}

class MyHomePage extends StatelessWidget {
  static const String routeName = '/';

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton(
                child: const Text('Counter Cubit BLoC'),
                color: Colors.teal,
                onPressed: () {
                  Navigator.of(context).pushNamed(CounterCubitPage.routeName);
                },
              ),
              RaisedButton(
                child: const Text('Hydrated Counter Cubit BLoC'),
                color: Colors.red,
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(HydratedCounterCubitPage.routeName);
                },
              ),
              RaisedButton(
                child: const Text('Counter BLoC'),
                color: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pushNamed(CounterPage.routeName);
                },
              ),
            ],
          ),
        ),
      );
}
