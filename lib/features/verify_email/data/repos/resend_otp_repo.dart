import 'package:e_commerce_app/core/networking/api_error_handler.dart';
import 'package:e_commerce_app/core/networking/api_result.dart';
import 'package:e_commerce_app/core/networking/api_service.dart';
import 'package:e_commerce_app/features/verify_email/data/models/resend_otp/resend_otp_request_body.dart';

class ResendOtpRepo {
  final ApiService apiService;
  ResendOtpRepo(this.apiService);

  Future<ApiResult<String>> resendOtp(
    ResendOtpRequestBody resendOtpRequestBody,
  ) async {
    try {
      final response = await apiService.resendOtp(resendOtpRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
