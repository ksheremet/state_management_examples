import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_example/bloc/cubit/counter/counter_cubit.dart';
import 'package:state_management_example/bloc/cubit/counter/counter_cubit_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: MyHomePage(title: 'Flutter State Management'),
        initialRoute: MyHomePage.routeName,
        routes: {
          CounterCubitPage.routeName: (context) => CounterCubitPage(),
        },
        builder: (context, child) => MultiBlocProvider(providers: [
          BlocProvider<CounterCubit>(
            lazy: true,
            create: (context) => CounterCubit(),
          ),
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  child: const Text('Counter BLoC'),
                  onPressed: () {
                    Navigator.of(context).pushNamed(CounterCubitPage.routeName);
                  }),
            ],
          ),
        ),
      );
}
