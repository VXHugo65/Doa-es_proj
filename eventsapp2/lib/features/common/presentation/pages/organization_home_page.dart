// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import 'package:events_app/core/resources/data_state.dart';
import 'package:events_app/core/utils/custom_navigation.dart';
import 'package:events_app/core/utils/custom_snackbar.dart';
import 'package:events_app/core/utils/mock_data.dart';
import 'package:events_app/features/common/data/models/event_model.dart';
import 'package:events_app/features/common/data/models/user_model.dart';
import 'package:events_app/features/common/data/repositories_impl/event_repository_impl.dart';
import 'package:events_app/features/common/presentation/pages/new_event_page.dart';
import 'package:events_app/features/common/presentation/widgets/event_tile.dart';
import 'package:events_app/features/common/presentation/widgets/loading_widget.dart';
import 'package:events_app/features/common/presentation/widgets/logout_icon_button.dart';

class OrganizationHomePage extends StatefulWidget {
  const OrganizationHomePage({super.key, required this.user});

  final UserModel user;

  @override
  State<OrganizationHomePage> createState() => _OrganizationHomePageState();
}

class _OrganizationHomePageState extends State<OrganizationHomePage> {
  final EventRepositoryImpl _eventRepositoryImpl = EventRepositoryImpl();
  List<EventModel> events = List<EventModel>.empty(growable: true);

  @override
  void initState() {
    _fetchEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Events App"),
        actions: const [
          LogoutIconButton(),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => _fetchEvents(),
        child: events.isEmpty
            ? const LoadingWidget()
            : ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) {
                  return EventTile(
                    event: events[index],
                    user: widget.user,
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => navigate(context, const NewEventPage()),
        icon: const Icon(Icons.add),
        label: const Text("Add New"),
      ),
    );
  }

  Future<void> _fetchEvents() async {
    DataState<List<EventModel>> res = await _eventRepositoryImpl.getEvents();
    if (res is DataSuccess) {
      setState(() {
        events = res.data!;
      });
    } else {
      setState(() {
        events = mockEvents;
      });
      showCustomSnackBar(
        context,
        "Error fetching events: ${res.error!.message!}",
      );
    }
  }
}
