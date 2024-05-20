import 'package:events_app/core/resources/data_state.dart';
import 'package:events_app/core/resources/remote_error.dart';
import 'package:events_app/features/common/data/data_sources/event_service/event_service.dart';
import 'package:events_app/features/common/data/models/event_model.dart';
import 'package:events_app/features/common/data/repositories/event_repository.dart';

class EventRepositoryImpl extends EventRepository {
  final EventService _eventService = EventService();

  @override
  Future<DataState<List<EventModel>>> getEvents() async {
    try {
      List<EventModel> events = await _eventService.readAll();
      return DataSuccess(events);
    } catch (e) {
      return DataFailure(
        RemoteError(code: null, message: e.toString()),
      );
    }
  }

  @override
  Future<DataState<EventModel>> create(EventModel event) async {
    try {
      await _eventService.create(event);
      // print(">>>>>>>>>>   NON ERROR2");
      return DataSuccess(event);
    } catch (e) {
      // print(">>>>>>>>>>   ERROR2");
      return DataFailure(
        RemoteError(code: null, message: e.toString()),
      );
    }
  }
}
