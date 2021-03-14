import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/toan_bloc.dart';
import 'cubit/toan_cubit.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: CupertinoColors.activeBlue,
        barBackgroundColor: CupertinoColors.white,
      ),
      home: BlocProvider(
        create: (context) => ToanCubit(),
        child: BlocBuilder<ToanCubit, ToanState>(
          builder: (context, state) {
            return BlocProvider(
              create: (context) => ToanBloc(),
              child: MyHomePage(),
            );
          },
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.bolt),
          label: "Cubit",
          backgroundColor: CupertinoColors.activeGreen,
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.barcode),
          label: "bloC",
        ),
      ]),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) => CupertinoPageScaffold(
            child: Scaffold(
                body: index == 0
                    ? BlocBuilder<ToanCubit, ToanState>(
                        builder: (context, state) {
                          return Center(
                            child: Text(
                              "${state.counterValue}",
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          );
                        },
                      )
                    : BlocBuilder<ToanBloc, int>(
                        builder: (context, count) {
                          return Center(
                            child: Text(
                              "$count",
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          );
                        },
                      ),
                floatingActionButton: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: FloatingActionButton(
                        onPressed: () {
                          index == 0
                              ? context.read<ToanCubit>().increment()
                              : context
                                  .read<ToanBloc>()
                                  .add(ToanEvent.increment);
                        },
                        child: const Icon(Icons.add),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: FloatingActionButton(
                        onPressed: () {
                          index == 0
                              ? context.read<ToanCubit>().decrement()
                              : context
                                  .read<ToanBloc>()
                                  .add(ToanEvent.decrement);
                        },
                        child: const Icon(Icons.remove),
                      ),
                    )
                  ],
                )),
            navigationBar: CupertinoNavigationBar(
              middle: index == 0
                  ? Text(
                      "Example Cubit",
                      style: TextStyle(color: CupertinoColors.systemRed),
                    )
                  : Text(
                      "Example bloC",
                      style: TextStyle(color: CupertinoColors.systemRed),
                    ),
            ),
          ),
        );
      },
    );
  }
}
