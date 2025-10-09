import 'package:e_commerce_app/core/networking/api_constants.dart';
import 'package:e_commerce_app/core/networking/api_error_handler.dart';
import 'package:e_commerce_app/core/networking/api_result.dart';
import 'package:e_commerce_app/core/networking/api_service.dart';
import 'package:e_commerce_app/features/login/data/models/login_request_body.dart';
import 'package:e_commerce_app/features/login/data/models/login_response.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);
  Future<ApiResult<LoginResponse>> login(String email, String password) async {
    try {
      final response = await _apiService.login(
        LoginRequestBody(email: email, password: password),
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
