//
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
//
// import '../../Controller/home_controller.dart';
// import '../../Model/categories_model.dart';
// import '../../Utils/linkapi.dart';
//
// class ListCategoriesHome extends GetView<HomeControllerImp> {
//   const ListCategoriesHome({Key? key}) : super(key: key);
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
// class Categories extends GetView<HomeControllerImp> {
//   final CategoriesModel categoriesModel;
//   final int? i;
//   const Categories({Key? key, required this.categoriesModel, required this.i})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         controller.goToItems(controller.categories, i! , categoriesModel.id!);
//       },
//       child: Column(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//                 color: Colors.purple[200],
//                 borderRadius: BorderRadius.circular(20)),
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             height: 70,
//             width: 70,
//             child: SvgPicture.network(
//                 "${AppLink.imagestCategories}/${categoriesModel.categoryImage}",
//                 color: Colors.purple[200]),
//           ),
//           Text(
//             "${categoriesModel.categoryName}",
//             style: const TextStyle(fontSize: 13, color: Colors.black),
//           )
//         ],
//       ),
//     );
//   }
// }