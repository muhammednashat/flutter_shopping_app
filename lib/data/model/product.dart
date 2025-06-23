class Product {
  String id;
  String name;
  String imageUrl;
  String category;
  bool isNew;
  bool isOnSale;
  String brandName;
  double rating;
  double originalPrice;
  double salePrice;
  String discount;
  String description;
  String mainCategory;
  String subCategory;
  int numRating;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.category,
    required this.isNew,
    required this.isOnSale,
    required this.brandName,
    required this.rating,
    required this.originalPrice,
    required this.salePrice,
    required this.discount,
    required this.description,
    required this.mainCategory,
    required this.subCategory,
    required this.numRating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      imageUrl: json['imageUrl']?.toString() ?? '',
      category: json['category']?.toString() ?? '',
      isNew: json['isnew'] ?? false,
      isOnSale: json['isOnSale'] ?? false,
      brandName: json['brandName']?.toString() ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      originalPrice: (json['originalPrice'] ?? 0).toDouble(),
      salePrice: (json['salePrice'] ?? 0).toDouble(),
      discount: json['discount']?.toString() ?? '0%',
      description: json['description']?.toString() ?? '',
      mainCategory: json['mainCategory']?.toString() ?? '',
      subCategory: json['subCategory']?.toString() ?? '',
      numRating: (json['numRating'] ?? 0) as int,
    );
  }

  toJson() {}
  String toString() {
    return 'Product(id: $id, name: $name, imageUrl: $imageUrl, category: $category, isNew: $isNew, isOnSale: $isOnSale, brandName: $brandName, rating: $rating, originalPrice: $originalPrice, salePrice: $salePrice, discount: $discount)';
  }
}
