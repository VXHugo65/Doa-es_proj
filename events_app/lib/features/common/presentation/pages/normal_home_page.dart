import 'package:events_app/core/resources/data_state.dart';
import 'package:events_app/features/common/data/models/event_model.dart';
import 'package:events_app/features/common/data/repositories_impl/event_repository_impl.dart';
import 'package:flutter/material.dart';

class NormalHomePage extends StatefulWidget {
  const NormalHomePage({super.key});

  @override
  State<NormalHomePage> createState() => _NormalHomePageState();
}

class _NormalHomePageState extends State<NormalHomePage> {
  final EventRepositoryImpl _eventRepositoryImpl = EventRepositoryImpl();
  List<EventModel> events = List<EventModel>.empty(growable: true);
  @override
  Future<void> initState() async {
    DataState<List<EventModel>> res = await _eventRepositoryImpl.getEvents();
    if (res is DataSuccess) {
      events = res.data!;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(res.error!.message!),
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Normal Homepage"),
      ),
    );
  }
}
