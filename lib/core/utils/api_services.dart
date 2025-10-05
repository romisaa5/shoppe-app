import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio = Dio();
  Future<Response> post({
    required body,
    required String url,
    required String tokken,
    String? contentType,
  }) async {
    var response = await dio.post(
      url,
      data: body,
      options: Options(
        contentType: contentType,
        headers: {'Authorization': "Bearer $tokken"},
      ),
    );
    return response;
  }
}
