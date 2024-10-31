import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_test/Bloc/data/data_event.dart';
import 'package:ui_test/Bloc/data/data_stste.dart';
import 'package:ui_test/data/data.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(DataLoadingState()) {
    on<GetPostEvent>((event, emit) async {
      try {
        final result = await PostRepository.getData();
        emit(DataSuccessState(result));
      } catch (e) {
        print('error $e');
        emit(DataErrorState(message: e.toString()));
      }
    });
  }
}
