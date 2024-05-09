import 'dart:convert';

import 'package:events_app/core/constants/constants.dart';
import 'package:events_app/features/common/data/models/user_model.dart';
import 'package:http/http.dart' as http;


class UserCrudService {
    Future<void> create(UserModel user) async {
    await http.post(
      Uri.parse(baseUrl),
      body: jsonEncode(user.toJson()),
    );
  }

  Future<List<UserModel>> readAll() async {
    Uri uri = Uri.parse(baseUrl); //TODO: Add the correcto endpoint
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      List<UserModel> users =
          data.map((e) => UserModel.fromJson(e)).toList();
      return users;
    } else {
      return List<UserModel>.empty();
    }
  }

  Future<UserModel?> read(String id) async {
    Uri uri = Uri.parse("$baseUrl/$id");  //TODO: Add the correcto endpoint
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      UserModel user = UserModel.fromJson(jsonDecode(response.body));
      return user;
    } else {
      return null;
    }
  }

  Future<void> update(UserModel user) async {
    await http.put(
      Uri.parse(baseUrl),  //TODO: Add the correcto endpoint
      body: jsonEncode(user.toJson()),
    );
  }

  Future<void> delete(UserModel user) async {
    await http.delete(
      Uri.parse(baseUrl),  //TODO: Add the correcto endpoint
      body: jsonEncode(user.toJson()),
    );
  }

}