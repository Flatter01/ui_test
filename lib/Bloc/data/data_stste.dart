import 'package:ui_test/models/data_model.dart';

abstract class DataState {}

class DataLoadingState extends DataState {}

class DataErrorState extends DataState {
  final String message;

  DataErrorState({required this.message});
}

class DataSuccessState extends DataState {
  final List<PostModel> model;
  DataSuccessState(this.model);
}
