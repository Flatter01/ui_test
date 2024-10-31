import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_test/Bloc/photo/photo_bloc.dart';
import 'package:ui_test/Bloc/photo/photo_event.dart';
import 'package:ui_test/Bloc/photo/photo_state.dart';

class ImagePickerExample extends StatefulWidget {
  @override
  _ImagePickerExampleState createState() => _ImagePickerExampleState();
}

class _ImagePickerExampleState extends State<ImagePickerExample> {
  // File? _selectedImage;

  // Future<void> _pickImage() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles();

  //   if (result != null) {
  //     File imageFile = File(result.files.single.path!);
  //     setState(() {
  //       _selectedImage = imageFile;
  //     });
  //   } else {
  //     setState(() {
  //       _selectedImage = null;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PhotoBloc, PhotoState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () =>
                      context.read<PhotoBloc>().add(ReceivingPhoto()),
                  child: const Text('Выбрать изображение'),
                ),
                const SizedBox(height: 20),
                state.selectedImage != null
                    ? Image.file(
                        state.selectedImage!,
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                      )
                    : const Text(
                        'Изображение не выбрано',
                        style: TextStyle(fontSize: 16),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
