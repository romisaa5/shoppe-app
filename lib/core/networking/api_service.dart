import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/networking/api_constants.dart';
import 'package:e_commerce_app/features/login/data/models/login_request_body.dart';
import 'package:e_commerce_app/features/login/data/models/login_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.loginEndpoint)
  Future<LoginResponse> login(@Body() LoginRequestBody body);
}
