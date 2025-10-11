import 'item.dart';

class Products {
  List<Item>? items;
  int? page;
  int? pageSize;
  int? totalCount;
  bool? hasNextPage;
  bool? hasPreviousPage;

  Products({
    this.items,
    this.page,
    this.pageSize,
    this.totalCount,
    this.hasNextPage,
    this.hasPreviousPage,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    items: (json['items'] as List<dynamic>?)
        ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
        .toList(),
    page: json['page'] as int?,
    pageSize: json['pageSize'] as int?,
    totalCount: json['totalCount'] as int?,
    hasNextPage: json['hasNextPage'] as bool?,
    hasPreviousPage: json['hasPreviousPage'] as bool?,
  );

  Map<String, dynamic> toJson() => {
    'items': items?.map((e) => e.toJson()).toList(),
    'page': page,
    'pageSize': pageSize,
    'totalCount': totalCount,
    'hasNextPage': hasNextPage,
    'hasPreviousPage': hasPreviousPage,
  };
}
