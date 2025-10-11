import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/networking/api_constants.dart';
import 'package:e_commerce_app/features/home/data/models/category/list_of_category.dart';
import 'package:e_commerce_app/features/login/data/models/login_request_body.dart';
import 'package:e_commerce_app/features/login/data/models/login_response.dart';
import 'package:e_commerce_app/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:e_commerce_app/features/sign_up/data/models/sign_up_response.dart';
import 'package:e_commerce_app/features/verify_email/data/models/resend_otp/resend_otp_request_body.dart';
import 'package:e_commerce_app/features/verify_email/data/models/verify_email/verify_email_request_body.dart';
import 'package:e_commerce_app/features/verify_email/data/models/verify_otp/verify_otp_request_body.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  // Login API
  @POST(ApiConstants.loginEndpoint)
  Future<LoginResponse> login(@Body() LoginRequestBody body);

  // Signup API
  @POST(ApiConstants.registerEndpoint)
  Future<SignupResponse> signup(@Body() SignupRequestBody signupRequestBody);

  // Verify Email API
  @POST(ApiConstants.apiVerifyEmail)
  Future<String> verifyEmail(
    @Body() VerifyEmailRequestBody verifyEmailRequestBody,
  );
  // Verify Otp API
  @POST(ApiConstants.apiVerifyOtp)
  Future<String> verifyOtp(@Body() VerifyOtpRequestBody verifyOtpRequestBody);

  // Resend Otp API
  @POST(ApiConstants.apiResendOtp)
  Future<String> resendOtp(@Body() ResendOtpRequestBody resendOtpRequestBody);

  // Category API
  @GET(ApiConstants.apiCategories)
  Future<ListOfCatgory> getCategories();
}
