import 'category.dart';

class ListOfCatgory {
  List<Category>? categories;

  ListOfCatgory({this.categories});

  factory ListOfCatgory.fromJson(Map<String, dynamic> json) => ListOfCatgory(
    categories: (json['categories'] as List<dynamic>?)
        ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'categories': categories?.map((e) => e.toJson()).toList(),
  };
}
