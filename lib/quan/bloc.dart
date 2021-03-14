import 'package:bloc_example/quan/cubit/countercubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'quan_bloc.dart';
import 'quan_event.dart';
import 'quan_state.dart';
import 'package:flutter_cubit/flutter_cubit.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CubitProvider(
          create: (context) => CountercubitCubit(),
          child: CubitProvider(
              create: (context) => CountercubitCubit(), child: MyHomePage())),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  // final qBloc = QuanBloc(); //init bloc

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quan example title"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(
            //   'You have pushed the button this many times:',
            // ),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headline4,
            // ),
            CubitBuilder<CountercubitCubit, CountercubitState>(
              builder: (_, cubitState) => Text(
                (cubitState is CountercubitStateFilled)
                    ? "${cubitState.value}"
                    : "0",
                style: Theme.of(context).textTheme.headline1,
              ),
            )
          ],
        ),
        // child: StreamBuilder<QuanState>(
        //   // Using a StreamBuilder to listen Stream
        //   stream: qBloc.stController
        //       .stream, // Transfer stream of stateController to listen
        //   initialData: qBloc.num, // init the begin value = zero
        //   builder: (BuildContext context, AsyncSnapshot<QuanState> snapshot) {
        //     return Text(
        //         'You have pushed the button this many times: ${snapshot.data.number}'); // update UI
        //   },
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            // qBloc.evController.sink.add(IncreaseNumber(1)), //_incrementCounter,
            context.cubit<CountercubitCubit>().cubitIncrement(1),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   qBloc.dispose(); // dispose bloc
  // }
}
