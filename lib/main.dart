import 'package:demo_app/color_bloc.dart';
import 'package:demo_app/counter_bloc.dart';
import 'package:demo_app/counter_widget.dart';
import 'package:demo_app/unnamed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SimpleApp(),
    );
  }
}

class SimpleApp extends StatelessWidget {
  Color stateToColor(ColorState state) {
    switch (state) {
      case ColorState.yellow:
        return Colors.yellow;
        break;
      case ColorState.red:
        return Colors.red;
        break;
      case ColorState.blue:
        return Colors.blue;
        break;
    }
  }

  ColorBloc _colorBloc = ColorBloc();
  CounterBloc _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: _counterBloc,
      child: BlocProvider<ColorBloc>(
        bloc: _colorBloc,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 24.0),
            child: BlocBuilder<ColorEvent, ColorState>(
              bloc: _colorBloc,
              builder: (BuildContext context, ColorState state) {
                print("Llamando al ColorBloc");
                return AppBar(
                  title: Text(state.toString()),
                  backgroundColor: stateToColor(state),
                );
              },
            ),
          ),
          body: BlocBuilder<ColorEvent, ColorState>(
            bloc: _colorBloc,
            builder: (context, state) {
              MediaQueryData mq = MediaQuery.of(context);

              return Container(
                width: mq.size.width,
                color: stateToColor(state),
                child: Column(
                  children: <Widget>[
                    RaisedButton(
                      child: Text("Rojo"),
                      onPressed: () {
                        _colorBloc.dispatch(ColorEvent.changeToRed);
                      },
                    ),
                    RaisedButton(
                        child: Text("Azul"),
                        onPressed: () {
                          _colorBloc.dispatch(ColorEvent.changeToBlue);
                        }),
                    RaisedButton(
                        child: Text("Amarillo"),
                        onPressed: () {
                          _colorBloc.dispatch(ColorEvent.changeToYellow);
                        }),

                    CounterWidget(),

                    unnamed(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
