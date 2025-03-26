 import 'package:job_portal_app/data/repositories/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  // final _apiClient = di.get<ApiClient>();
  // final _session = di.get<UserSessionService>();
  // @override
  // Future<Result<UserModel, Failure>> getUserProfile({
  //   Map<String, dynamic>? parameters,
  // }) async {
  //   try {
  //     final result = await _apiClient.getUserProfile(parameters: parameters);
  //     if (result.statusCode != 200) {
  //       return Result.left(Failure(result.message));
  //     }
  //     final record = UserModel.fromJson(result.data);
  //     await _session.storeUser(record);
  //     return Result.right(record, message: result.message);
  //   } catch (error) {
  //     return Result.left(Failure(error.toString()));
  //   }
  // }
 
}
