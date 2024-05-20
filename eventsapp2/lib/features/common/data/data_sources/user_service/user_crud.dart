import 'dart:convert';

import 'package:events_app/core/constants/constants.dart';
import 'package:events_app/features/common/data/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserCrudService {
  Future<bool> create(UserModel user) async {
    var response = await http.post(
      Uri.parse("$baseUrl/user/create.php"),
      // body: jsonEncode(user.toJson()),
      body: jsonEncode(<String, dynamic>{
        "email": user.email,
        "name": user.name,
        "password": "1234",
        "designation": user.designation.name
      }),
    );
    if (response.body == "Employee created successfully.") {
      print(">>>>>>>>>>2 ${response.body}");
      return true;
    }
    return false;
  }

  Future<List<UserModel>> readAll() async {
    Uri uri = Uri.parse("$baseUrl/user/read.php");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      List<UserModel> users = data.map((e) => UserModel.fromMap(e)).toList();
      return users;
    } else {
      return List<UserModel>.empty();
    }
  }

  Future<UserModel?> read(String email) async {
    Uri uri = Uri.parse("$baseUrl/user/readOne.php");
    final response = await http.post(
      uri,
      body: jsonEncode(<String, dynamic>{
        'email': email,
      }),
    );

    if (response.statusCode == 200) {
      UserModel user = UserModel.fromMap(jsonDecode(response.body));
      return user;
    } else {
      return null;
    }
  }

  Future<void> update(UserModel user) async {
    await http.put(
      Uri.parse(baseUrl), //TODO: Add the correctend point
      body: jsonEncode(user.toJson()),
    );
  }

  Future<void> delete(UserModel user) async {
    await http.delete(
      Uri.parse(baseUrl), //TODO: Add the correctend point
      body: jsonEncode(user.toJson()),
    );
  }
}
