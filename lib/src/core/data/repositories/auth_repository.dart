import 'package:spend_tracker/src/core/data/data_source/remote/auth_api.dart';
import 'package:spend_tracker/src/core/data/models/result_model.dart';
import 'package:spend_tracker/src/core/data/models/signup_model.dart';

class AuthRepository {
  AuthApi _authApi;

  AuthRepository({required AuthApi authApi}) : _authApi = authApi;
  Future<ResultModel> signUp(String name, String email, String password) async {
    final signupMode = SignupModel(
      name: name,
      email: email,
      password: password,
    );
    return await _authApi.signup(signupMode);
  }
}
