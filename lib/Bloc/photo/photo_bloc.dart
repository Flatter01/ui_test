import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_test/Bloc/photo/photo_event.dart';
import 'package:ui_test/Bloc/photo/photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  PhotoBloc() : super(const PhotoState()) {
    on<ReceivingPhoto>(
      (event, emit)async{
          FilePickerResult? result = await FilePicker.platform.pickFiles();
          if (result != null) {
            File imageFile = File(result.files.single.path!);
            emit(PhotoState(selectedImage: imageFile));
          } else {
            emit(const PhotoState(selectedImage: null));
          }
      },
    );
  }
}
