import 'dart:convert';

import 'package:events_app/core/constants/constants.dart';
import 'package:events_app/features/common/data/models/comment_model.dart';
import 'package:http/http.dart' as http;

class CommentService {
  Future<void> create(CommentModel comment) async {
    await http.post(
      Uri.parse(baseUrl),
      body: jsonEncode(comment.toJson()),
    );
  }

  Future<List<CommentModel>> read() async {
    Uri uri = Uri.parse(baseUrl); //TODO: Add the correcto endpoint
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      List<CommentModel> events = data.map((e) => CommentModel.fromJson(e)).toList();
      return events;
    } else {
      return List<CommentModel>.empty();
    }
  }
}
