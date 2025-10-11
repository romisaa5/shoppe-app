import 'package:e_commerce_app/core/networking/api_error_handler.dart';
import 'package:e_commerce_app/core/networking/api_result.dart';
import 'package:e_commerce_app/core/networking/api_service.dart';
import 'package:e_commerce_app/features/home/data/models/category/list_of_category.dart';

class CategoryRepo {
  final ApiService apiService;
  CategoryRepo(this.apiService);
  Future<ApiResult<ListOfCatgory>> getCategories() async {
    try {
      final response = await apiService.getCategories();
      print('✅ Categories API response: $response');
      return ApiResult.success(response);
    } catch (error) {
      print('❌ Categories API error: $error');
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
