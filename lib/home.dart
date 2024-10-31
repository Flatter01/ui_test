import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_test/Bloc/color/color_bloc.dart';
import 'package:ui_test/Bloc/color/color_event.dart';
import 'package:ui_test/Bloc/color/color_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ColorBloc, ColorState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Center(
                  child: Wrap(
                      spacing: 10,
                      runSpacing: 20,
                      children: List.generate(
                        state.words.length,
                        (i) => GestureDetector(
                          onTap: () {
                            context
                                .read<ColorBloc>()
                                .add(PickStatusEvent(index: i));
                          },
                          child: AnimatedContainer(
                            padding: state.pickedData.contains(i)
                                ? EdgeInsets.symmetric(vertical: 10)
                                : EdgeInsets.zero,
                            duration: const Duration(milliseconds: 500),
                            height: 60,
                            width:  state.pickedData.contains(i) ? 120 : 100,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: state.pickedData.contains(i)
                                    ? Colors.black
                                    : Colors.grey),
                            child: Text(
                              state.words[i],
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                      )),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
