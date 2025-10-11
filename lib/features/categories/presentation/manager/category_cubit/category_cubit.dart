import 'package:e_commerce_app/core/networking/api_result.dart';
import 'package:e_commerce_app/features/categories/data/models/category/list_of_category.dart';
import 'package:e_commerce_app/features/categories/data/repos/category_repo.dart';
import 'package:e_commerce_app/features/categories/presentation/manager/category_cubit/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepo categoryRepo;
  CategoryCubit(this.categoryRepo) : super(CategoryState.initial());
  Future<void> fetchCategories() async {
    emit(CategoryState.loading());
    try {
      final response = await categoryRepo.getCategories();

      response.when(
        success: (data) {
          ListOfCatgory listOfCatgory = data.categories != null
              ? ListOfCatgory(categories: data.categories)
              : ListOfCatgory(categories: []);
          print("Fetched categories: ${data.categories?.length}");
          emit(CategoryState.success(listOfCatgory));
        },
        failure: (error) {
          emit(
            CategoryState.failure(
              error.apiErrorModel.message ??
                  "An unexpected error occurred. Please try again.",
            ),
          );
        },
      );
    } catch (e) {
      print("Category error: $e");
      emit(
        CategoryState.failure(
          "An unexpected error occurred. Please try again.",
        ),
      );
    }
  }
}
