import 'package:demo_app/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);
    return BlocBuilder<CounterEvent,int>(
      bloc: _counterBloc,
      builder: (context, state){
        return Text(_counterBloc.currentState.toString());
      },
    ) ;


  }
}
