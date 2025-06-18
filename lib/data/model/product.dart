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
      id: json['_id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      category: json['category'] as String,
      isNew: json['isnew'] as bool,
      isOnSale: json['isOnSale'] as bool,
      brandName: json['brandName'] as String,
      rating: (json['rating'] as num).toDouble(),
      originalPrice: (json['originalPrice'] as num).toDouble(),
      salePrice: (json['salePrice'] as num).toDouble(),
      discount: json['discount'] as String,
      description: json['description'] as String,
      mainCategory: json['mainCategory'] as String,
      subCategory: json['subCategory'] as String,
      numRating: json['numRating'] as int,
    );
  }

  toJson() {}
  String toString() {
    return 'Product(id: $id, name: $name, imageUrl: $imageUrl, category: $category, isNew: $isNew, isOnSale: $isOnSale, brandName: $brandName, rating: $rating, originalPrice: $originalPrice, salePrice: $salePrice, discount: $discount)';
  }
}
