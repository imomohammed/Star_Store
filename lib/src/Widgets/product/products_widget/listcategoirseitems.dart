//
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:star/src/Controller/produsct_controller.dart';
//
// import '../../Model/categories_model.dart';
//
// class ListCategoriesItems extends GetView<ProductsControllerImp> {
//   const ListCategoriesItems({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 100,
//       child: ListView.separated(
//         separatorBuilder: (context, index) => const SizedBox(width: 10),
//         itemCount: controller.categories.length,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return Categories(
//             i: index,
//             categoriesModel:
//             CategoriesModel.fromJson(controller.categories[index]),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class Categories extends GetView<ProductsControllerImp> {
//   final CategoriesModel categoriesModel;
//   final int? i;
//   const Categories({Key? key, required this.categoriesModel, required this.i})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         // controller.goToItems(controller.categories, i!);
//         controller.changeCat(i! , categoriesModel.id!);
//       },
//       child: Column(
//         children: [
//           GetBuilder<ProductsControllerImp>(
//               builder: (controller) => Container(
//
//                 padding: EdgeInsets.only(right: 10 , left: 10 , bottom: 5),
//                 decoration: controller.selectedCat == i
//                     ? BoxDecoration(
//                     border: Border(
//                         bottom: BorderSide(
//                             width: 3, color: Colors.purple)))
//                     : null,
//                 child: Text(
//                   "${categoriesModel.categoryName}",
//                   style:
//                   const TextStyle(fontSize: 20, color:Colors.grey),
//                 ),
//               ))
//         ],
//       ),
//     );
//   }
// }