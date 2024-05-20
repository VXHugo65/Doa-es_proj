import 'package:events_app/core/resources/data_state.dart';
import 'package:events_app/features/common/data/models/user_model.dart';

abstract class UserRepository {
  
  Future<DataState<bool>> create(UserModel user);

  Future<DataState<List<UserModel>>> read();
  
  Future<DataState<UserModel>> readOne(String email);


}
