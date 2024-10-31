import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_test/Bloc/color/color_event.dart';
import 'package:ui_test/Bloc/color/color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc() : super(ColorState(pickedData: const {})) {
    on<PickStatusEvent>((event, emit) {
      Set<dynamic> data = List.from(state.pickedData).toSet();
      if (data.contains(event.index)) {
        data.remove(event.index);
      } else {
        data.add(event.index);
      }
      emit(ColorState(pickedData: data));
    });
  }
}
