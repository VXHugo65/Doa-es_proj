import 'package:events_app/core/resources/data_state.dart';
import 'package:events_app/features/common/data/models/comment_model.dart';

abstract class CommentRepository {
  Future<void> create(CommentModel comment);

  Future<DataState<List<CommentModel>>> read();
}
