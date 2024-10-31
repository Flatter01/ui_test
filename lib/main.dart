import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_test/Bloc/data/data_bloc.dart';
import 'package:ui_test/Bloc/photo/photo_bloc.dart';
import 'package:ui_test/image_picker.dart';
import 'package:ui_test/post_data.dart';
import 'package:ui_test/ui_past.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (_) => PhotoBloc(),
    ),
    BlocProvider(
      create: (_) => DataBloc(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UiPast(),
    );
  }
}
