import 'package:demo_app/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class unnamed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);

    Ticker ticker = new Ticker((Duration duration){
      print(duration);
      _counterBloc.dispatch(CounterEvent.countUp);
    });
    ticker.start();
    return Container();
  }
}
