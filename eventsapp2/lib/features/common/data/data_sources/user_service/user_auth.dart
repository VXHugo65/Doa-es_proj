import 'dart:convert';

import 'package:events_app/core/constants/constants.dart';
import 'package:events_app/features/common/data/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserAuthService {
  Future<void> signup(UserModel user) async {
    Uri uri = Uri.parse(baseUrl); //TODO: Add the correctend point
    await http.post(
      uri,
      body: jsonEncode(user.toJson()),
    );
  }

  Future<void> login(String email, String password) async {
    Uri uri = Uri.parse(baseUrl); //TODO: Add the correctend point
    final response = await http.put(
      uri,
      body: jsonEncode(<String, dynamic>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception();
    }
  }
}
