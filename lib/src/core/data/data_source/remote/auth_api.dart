import 'package:dio/dio.dart';
import 'package:spend_tracker/src/core/data/models/result_model.dart';
import 'package:spend_tracker/src/core/data/models/signup_model.dart';
import 'package:spend_tracker/src/core/network/api_routes.dart';
import 'package:spend_tracker/src/core/network/api_service.dart';

class AuthApi {
  Future<ResultModel> signup(SignupModel signupModel) async {
    try {
      final response = await ApiService.post(registerUri, signupModel.toJson());
      return ResultModel(success: true, message: response.data['message']);
    } on DioException catch (e) {
      return ResultModel(
        success: false,
        message: e.response?.data['message'] ?? 'An error occurred, try again',
        errors: e.response?.data['errors'],
      );
    }
  }
}
