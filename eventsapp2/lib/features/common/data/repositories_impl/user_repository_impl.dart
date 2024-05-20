import 'package:events_app/core/resources/data_state.dart';
import 'package:events_app/core/resources/remote_error.dart';
import 'package:events_app/features/common/data/data_sources/user_service/user_crud.dart';
import 'package:events_app/features/common/data/models/user_model.dart';
import 'package:events_app/features/common/data/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserCrudService _userCrudService = UserCrudService();

  @override
  Future<DataState<bool>> create(UserModel user) async {
    try {
      await _userCrudService.create(user);
      return DataSuccess(true);
    } catch (e) {
      return DataFailure(RemoteError(code: null, message: e.toString()));
    }
  }

  @override
  Future<DataState<List<UserModel>>> read() async {
    try {
      List<UserModel> users = await _userCrudService.readAll();
      return DataSuccess(users);
    } catch (e) {
      return DataFailure(RemoteError(code: null, message: e.toString()));
    }
  }

  @override
  Future<DataState<UserModel>> readOne(String email) async {
    try {
      UserModel? user = await _userCrudService.read(email);
      return DataSuccess(user!);
    } catch (e) {
      return DataFailure(RemoteError(code: null, message: e.toString()));
    }
  }
}
