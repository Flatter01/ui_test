import 'package:dio/dio.dart';
import 'package:ui_test/models/data_model.dart';

class PostRepository {
  static Future<List<PostModel>> getData() async {
    final response =
        await Dio().get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode != null && response.statusCode! >= 200 ||
        response.statusCode! <= 300) {
      print('success ${response.statusCode} -> ${response.data}');
      return (response.data as List).map((element) {
        return PostModel.fromJson(element);
      }).toList();
    } else {
      throw Exception(response.statusMessage);
    }
  }
}
