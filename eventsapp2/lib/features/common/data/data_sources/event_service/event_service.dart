import 'dart:convert';

import 'package:events_app/core/constants/constants.dart';
import 'package:events_app/features/common/data/models/event_model.dart';
import 'package:http/http.dart' as http;

class EventService {
  Future<bool> create(EventModel event) async {
    // await http.post(
    var response = await http.post(
      Uri.parse("$baseUrl/event/create.php"),
      // body: jsonEncode(<String, dynamic>{
      //   'event': event.toJson(),
      // }),
      body: jsonEncode(<String, dynamic>{
        'EventName': event.name,
        'EventDate': event.date,
        'EventTime': event.time,
        'Location': event.location,
        'EventType': event.type,
        'OrganizationName': event.organizationName,
        'DonationMethods': event.donationMethods,
        'DonationGoal': event.donationGoal,
        'DonationProgress': event.donationProgress,
        'EventDescription': event.description,
        "EventImageURL": "https://example.com/event-image.jpg",
        "EventVideoURL": "https://example.com/event-video.mp4",
        "Testimonials": "Jane Smith"
      }),
    );

    if (response.body == "created successfully.") {
      print(">>>>>>>>>>1 ${response.body}");
      return true;
    }
    return false;
  }

  Future<List<EventModel>> readAll() async {
    // Uri uri = Uri.parse("https://doacao-api.000webhostapp.com/Donation-API/api/event/read.php");
    Uri uri = Uri.parse("$baseUrl/event/read.php");
    final response = await http.get(uri);

    // print(">>>>>>>>>>>>1 ${response.body.toString()}");
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      // print(">>>>>>>>>>>>3 ${response.body.toString()}");
      // List<EventModel> events = data.map((e) => EventModel.fromJson(e)).toList();
      List<EventModel> events = data.map((e) => EventModel.fromMap(e)).toList();

      // print(">>>>>>>>>>>>4 ${response.body.toString()}");
      return events;
    } else {
      // print(">>>>>>>>>>>>2 ${response.body}");
      return List<EventModel>.empty();
    }
  }

  Future<EventModel?> read(String id) async {
    Uri uri = Uri.parse("$baseUrl/$id"); //TODO: Add the correctend point
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
      Uri.parse(baseUrl), //TODO: Add the correctend point
      body: jsonEncode(event.toJson()),
    );
  }

  Future<void> delete(EventModel event) async {
    await http.delete(
      Uri.parse(baseUrl), //TODO: Add the correctend point
      body: jsonEncode(event.toJson()),
    );
  }
}
