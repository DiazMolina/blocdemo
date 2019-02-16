import 'package:bloc/bloc.dart';

enum ColorState{
  red,
  blue,
  yellow
}

enum ColorEvent{
  changeToRed,
  changeToBlue,
  changeToYellow,
}
class ColorBloc extends Bloc<ColorEvent,ColorState>{

  @override
  ColorState get initialState => ColorState.red;

  @override
  Stream<ColorState> mapEventToState(ColorState currentState, ColorEvent event) async*{
    switch(event){
      case ColorEvent.changeToBlue:
        yield ColorState.blue;
        break;
      case ColorEvent.changeToRed:
        yield ColorState.red;
        break;
      case ColorEvent.changeToYellow:
        yield ColorState.yellow;
        break;
    }

  }

}