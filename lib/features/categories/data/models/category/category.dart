class Category {
  String? id;
  String? name;
  String? description;
  String? coverPictureUrl;

  Category({this.id, this.name, this.description, this.coverPictureUrl});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json['id'] as String?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    coverPictureUrl: json['coverPictureUrl'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'coverPictureUrl': coverPictureUrl,
  };
}
