import 'package:dio/dio.dart';
import 'package:spend_tracker/src/core/network/api_routes.dart';

class ApiService {
  static final dio = Dio();

  static Future<Response> post(String url, Map<String, dynamic> body) async {
    final response = await dio.post(
      baseUrl + url,
      data: body,
      options: Options(headers: {'Accept': 'application/json'}),
    );

    return response;
  }
}
