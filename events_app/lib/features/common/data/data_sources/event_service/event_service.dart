import 'dart:convert';

import 'package:events_app/core/constants/constants.dart';
import 'package:events_app/features/common/data/models/event_model.dart';
import 'package:http/http.dart' as http;

class EventService {
  Future<void> create(EventModel event) async {
    await http.post(
      Uri.parse(baseUrl),
      body: jsonEncode(event.toJson()),
    );
  }

  Future<List<EventModel>> readAll() async {
    Uri uri = Uri.parse(baseUrl); //TODO: Add the correcto endpoint
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      List<EventModel> events =
          data.map((e) => EventModel.fromJson(e)).toList();
      return events;
    } else {
      return List<EventModel>.empty();
    }
  }

  Future<EventModel?> read(String id) async {
    Uri uri = Uri.parse("$baseUrl/$id");  //TODO: Add the correcto endpoint
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      EventModel event = EventModel.fromJson(jsonDecode(response.body));
      return event;
    } else {
      return null;
    }
  }

  Future<void> update(EventModel event) async {
    await http.put(
      Uri.parse(baseUrl),  //TODO: Add the correcto endpoint
      body: jsonEncode(event.toJson()),
    );
  }

  Future<void> delete(EventModel event) async {
    await http.delete(
      Uri.parse(baseUrl),  //TODO: Add the correcto endpoint
      body: jsonEncode(event.toJson()),
    );
  }
}
