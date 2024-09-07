// class CategoriesModel {
//   String? id;
//   String? categoryName;
//   String? categoryImage;
//
//
//   CategoriesModel(
//       {this.id,
//         this.categoryName,
//         this.categoryImage,
// });
//
//   CategoriesModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     categoryName = json['category_name'];
//     categoryImage = json['category_image'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['category_name'] = this.categoryName;
//     data['category_image'] = this.categoryImage;
//     return data;
//   }
// }
class CategoryModel {
  final int id;
  final String name;
  final String imageUrl;
  final List<SubCategory> subCategories;

  CategoryModel({required this.id, required this.name, required this.subCategories, required this.imageUrl});
}

class SubCategory {
  final int id;
  final String name;
  final String imageUrl;

  SubCategory({required this.id, required this.name,required this.imageUrl});
}
