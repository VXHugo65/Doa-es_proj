import 'package:events_app/core/resources/data_state.dart';
import 'package:events_app/features/common/data/models/event_model.dart';

abstract class EventRepository {
  Future<DataState<EventModel>> create(EventModel event);
  Future<DataState<List<EventModel>>> getEvents();
}