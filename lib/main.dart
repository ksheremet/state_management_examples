import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:state_management_example/bloc/cubit/counter/counter_cubit.dart';
import 'package:state_management_example/bloc/cubit/counter/counter_cubit_page.dart';
import 'package:state_management_example/bloc/hydrated_bloc/counter/hydrated_counter_cubit.dart';
import 'package:state_management_example/bloc/hydrated_bloc/counter/hydrated_counter_cubit_page.dart';

import 'bloc/bloc/counter/counter_bloc.dart';
import 'bloc/bloc/counter/counter_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Storage for Hydrated Cubit
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
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
        builder: (context, child) => MultiBlocProvider(
          providers: [
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
          ],
          child: child ?? SizedBox.shrink(),
        ),
      );
}

class MyHomePage extends StatelessWidget {
  static const String routeName = '/';

  MyHomePage({super.key, required this.title});

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
              ElevatedButton(
                child: const Text('Counter Cubit BLoC'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(CounterCubitPage.routeName);
                },
              ),
              SizedBox(height: 5),
              ElevatedButton(
                child: const Text('Hydrated Counter Cubit BLoC'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(HydratedCounterCubitPage.routeName);
                },
              ),
              SizedBox(height: 5),
              ElevatedButton(
                child: const Text('Counter BLoC'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(CounterPage.routeName);
                },
              ),
            ],
          ),
        ),
      );
}
