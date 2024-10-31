import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_test/Bloc/data/data_bloc.dart';
import 'package:ui_test/Bloc/data/data_event.dart';
import 'package:ui_test/Bloc/data/data_stste.dart';

class PostData extends StatefulWidget {
  const PostData({super.key});

  @override
  State<PostData> createState() => _PostDataState();
}

class _PostDataState extends State<PostData> {

  @override
  void initState() {
    // ! INIT STATE BIZDA FAQAT GINA BIR MARTA ISHGA TUSHADI VA BUILD ISHGA TUSHMASIDAN OLDIN
    super.initState();
    BlocProvider.of<DataBloc>(context).add(GetPostEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DataBloc, DataState>(builder: (context, state) {
        if (state is DataLoadingState) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        } else if (state is DataSuccessState) {
          return ListView.builder(
              itemCount: state.model.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.blueGrey,
                  child: ListTile(
                    title: Text(state.model[index].title ?? ''),
                  ),
                );
              });
        } else if (state is DataErrorState) {
          return Center(child: Text(state.message));
        }
        return SizedBox();
      }),
    );
  }
}
