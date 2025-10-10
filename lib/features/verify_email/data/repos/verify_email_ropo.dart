import 'package:e_commerce_app/core/networking/api_error_handler.dart';
import 'package:e_commerce_app/core/networking/api_result.dart' show ApiResult;
import 'package:e_commerce_app/core/networking/api_service.dart';
import 'package:e_commerce_app/features/verify_email/data/models/verify_email/verify_email_request_body.dart';

class VerifyEmailRopo {
  final ApiService _apiServices;
  VerifyEmailRopo(this._apiServices);

  Future<ApiResult> verifyEmail(
    VerifyEmailRequestBody verifyEmailRequestBody,
  ) async {
    try {
      final response = await _apiServices.verifyEmail(verifyEmailRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
