import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_test/Bloc/data/data_bloc.dart';
import 'package:ui_test/Bloc/data/data_event.dart';
import 'package:ui_test/Bloc/data/data_stste.dart';

class UiPast extends StatefulWidget {
  const UiPast({super.key});

  @override
  State<UiPast> createState() => _UiPastState();
}

class _UiPastState extends State<UiPast> {
  // @override
  // void initState() {
  //   super.initState();
  //   BlocProvider.of<DataBloc>(context).add(GetPostEvent());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
      ),
    body: BlocBuilder<DataBloc, DataState>(
        builder: (context, state) {
          if (state is DataLoadingState) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (state is DataSuccessState) {
            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: state.model.length,
              itemBuilder: (context, index) {
                final item = state.model[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: Colors.blueGrey[700],
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: const Icon(
                      Icons.article,
                      color: Colors.white,
                      size: 30,
                    ),
                    title: Text(
                      item.title ?? 'Untitled',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: const Text(
                      'Description goes here...',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white70,
                      size: 18,
                    ),
                  ),
                );
              },
            );
          } else if (state is DataErrorState) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(fontSize: 16, color: Colors.red),
              ),
            );
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<DataBloc>().add(GetPostEvent());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
