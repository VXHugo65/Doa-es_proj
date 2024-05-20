import 'package:events_app/core/resources/data_state.dart';
import 'package:events_app/core/resources/remote_error.dart';
import 'package:events_app/features/common/data/data_sources/comment_service/comment_service.dart';
import 'package:events_app/features/common/data/models/comment_model.dart';
import 'package:events_app/features/common/data/repositories/comment_repository.dart';

class CommentRepositoryImpl extends CommentRepository {
  final CommentService _commentService = CommentService();

  @override
  Future<DataState<bool>> create(CommentModel comment) async {
    try {
      await _commentService.create(comment);
      return DataSuccess(true);
    } catch (e) {
      return DataFailure(RemoteError(code: null, message: e.toString()));
    }
  }

  @override
  Future<DataState<List<CommentModel>>> read() async {
    try {
      List<CommentModel> comments = await _commentService.read();
      return DataSuccess(comments);
    } catch (e) {
      return DataFailure(RemoteError(code: null, message: e.toString()));
    }
  }
}
