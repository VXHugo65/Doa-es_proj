import 'package:events_app/core/utils/custom_navigation.dart';
import 'package:events_app/features/common/data/models/event_model.dart';
import 'package:events_app/features/common/data/models/user_model.dart';
import 'package:events_app/features/common/presentation/pages/event_details_page.dart';
import 'package:flutter/material.dart';

class EventTile extends StatelessWidget {
  const EventTile({
    super.key,
    required this.event, required this.user,
  });

  final EventModel event;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () => navigate(
          context,
          EventDetailsPage(
            event: event,
            user: user,
          ),
        ),
        tileColor: Colors.deepPurple[50],
        title: Text(event.name),
        subtitle: Text(
          "${event.description}. ${event.date}",
        ),
        trailing: const Icon(Icons.arrow_forward_ios_outlined),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
