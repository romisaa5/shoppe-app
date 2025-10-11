import 'package:e_commerce_app/features/categories/data/models/category/list_of_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'category_state.freezed.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.initial() = _Initial;
  const factory CategoryState.loading() = Loading;
  const factory CategoryState.success(ListOfCatgory data) = Success;
  const factory CategoryState.failure(String errorMessage) = Failure;
}
