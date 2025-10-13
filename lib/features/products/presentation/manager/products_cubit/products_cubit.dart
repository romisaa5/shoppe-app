import 'package:e_commerce_app/core/networking/api_result.dart';
import 'package:e_commerce_app/features/products/data/repos/products_repo.dart';
import 'package:e_commerce_app/features/products/presentation/manager/products_cubit/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepo productsRepo;
  ProductsCubit(this.productsRepo) : super(ProductsState.initial());
  Future<void> fetchProducts() async {
    emit(ProductsState.loading());
    try {
      final response = await productsRepo.getProducts();
      response.when(
        success: (data) {
          emit(ProductsState.success(data));
        },
        failure: (error) {
          emit(
            ProductsState.failure(
              error.apiErrorModel.message ??
                  "An unexpected error occurred. Please try again.",
            ),
          );
        },
      );
    } catch (e) {
      emit(
        ProductsState.failure(
          "An unexpected error occurred. Please try again.",
        ),
      );
    }
  }
}
