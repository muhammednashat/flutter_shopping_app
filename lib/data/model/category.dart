class Category {
  String id;
  String imageUrl;
  String category;
  String mainCategory;
  String subCategory;

  Category({
    required this.id,
    required this.category,
    required this.mainCategory,
    required this.subCategory,
    required this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category,
      'mainCategory': mainCategory,
      'subCategory': subCategory,
      'imageUrl': imageUrl,
    };
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'],
      category: json['category'],
      mainCategory: json['mainCategory'],
      subCategory: json['subCategory'],
      imageUrl: json['imageUrl'],
    );
  }
}
