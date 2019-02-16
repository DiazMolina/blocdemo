import 'package:bloc/bloc.dart';

enum CounterEvent {
  countUp,
  restart,
}

class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(int currentState, CounterEvent event) async* {
    switch (event) {
      case CounterEvent.countUp:
        yield currentState + 1;
        break;
      case CounterEvent.restart:
        yield 0;
        break;
    }
  }
}
