import 'package:flutter_bloc/flutter_bloc.dart';
import 'color_event.dart';
import 'color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc() : super(ColorState(red: 125.0, green: 125.0, blue: 125.0)) {
    on<ColorChanged>((event, emit) {
      emit(ColorState(red: event.red, green: event.green, blue: event.blue));
    });
  }
}
