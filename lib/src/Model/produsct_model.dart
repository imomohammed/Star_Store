// // models/product.dart
// class ProductsModel {
//   String? id;
//   String? productsName;
//   String? description;
//   double? price;
//   String? categoryId;
//   String? reviewId;
//   String? adtrebutId;
//   String? stockQuantity;
//   String? productsImage	;
//   String? productsCount;
//   String? productsActive;
//   String? productsData	;
//   String? categoryName;
//   String? categoryImage;
//   String? favorite;
//
//
//
//   ProductsModel({
//     required this.id,
//     required this.productsName,
//     required this.description,
//     required this.price,
//     required this.categoryId,
//     required this.reviewId,
//     required this.adtrebutId,
//     required this.stockQuantity,
//     required this.productsImage	,
//     required this.productsCount,
//     required this.productsActive,
//     required this.productsData	,
//     required this.categoryName,
//     required this.categoryImage,
//     required this.favorite})	;
//
//
//   ProductsModel.fromJson(Map<String, dynamic> json ) {
//     id = json['id'];
//     productsName = json['products_name'];
//     description = json['description'];
//     price = json['price'];
//     categoryId = json['category_id'];
//     reviewId = json['review_id'];
//     adtrebutId = json['adtrebut_id'];
//     stockQuantity = json['stock_quantity'];
//     productsImage = json['products_image'];
//     productsCount = json['products_count'];
//     productsActive = json['products_active'];
//     productsData = json['products_data'];
//     categoryName = json['category_name'];
//     categoryImage = json['category_image'];
//     favorite = json['favorite'];
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['products_name'] = this.productsName;
//     data['description'] = this.description;
//     data['price'] = this.price;
//     data['category_id'] = this.categoryId;
//     data['review_id'] = this.reviewId;
//     data['adtrebut_id'] = this.adtrebutId;
//     data['stock_quantity'] = this.stockQuantity;
//     data['products_image'] = this.productsImage;
//     data['products_count'] = this.productsCount;
//     data['products_active'] = this.productsActive;
//     data['products_data'] = this.productsData;
//     data['category_name'] = this.categoryName;
//     data['category_image'] = this.categoryImage;
//     return data;
//   }
//
// }
// class ProductModel {
//   final int id;
//   final String name;
//   final String imageUrl;
//   final double price;
//   final double originalPrice;
//   final int discount;
//   bool isFavorite;
//
//   ProductModel({
//     required this.id,
//     required this.name,
//     required this.imageUrl,
//     required this.price,
//     required this.originalPrice,
//     required this.discount,
//     this.isFavorite = false,
//   });
//
//   void toggleFavoriteStatus() {
//     isFavorite = !isFavorite;
//   }
// }

class ProductModel {
  final int id;
  final String name;
  final double price;
  final String imageUrl;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}