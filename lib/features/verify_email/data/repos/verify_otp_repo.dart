import 'package:e_commerce_app/core/networking/api_error_handler.dart';
import 'package:e_commerce_app/core/networking/api_service.dart';
import '../../../../core/networking/api_result.dart';
import '../models/verify_otp/verify_otp_request_body.dart';

class VerifyOtpRepo {
  final ApiService _apiServices;

  VerifyOtpRepo(this._apiServices);

  Future<ApiResult<String>> verifyEmail(
    VerifyOtpRequestBody verifyOtpRequestBody,
  ) async {
    try {
      final response = await _apiServices.verifyOtp(verifyOtpRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
