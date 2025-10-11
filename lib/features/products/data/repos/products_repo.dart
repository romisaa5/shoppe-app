import 'package:e_commerce_app/core/networking/api_error_handler.dart';
import 'package:e_commerce_app/core/networking/api_result.dart';
import 'package:e_commerce_app/core/networking/api_service.dart';
import 'package:e_commerce_app/features/products/data/models/products/products.dart';

class ProductsRepo {
  final ApiService apiService;
  ProductsRepo(this.apiService);
  Future<ApiResult<Products>> getProducts() async {
    try {
      final response = await apiService.getProducts();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
