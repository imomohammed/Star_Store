//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:star/src/Model/produsct_model.dart';
//
// import '../../Controller/home_controller.dart';
// import '../../Utils/linkapi.dart';
//
// class ListItemsHome extends GetView<HomeControllerImp> {
//   const ListItemsHome({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 140,
//       child: ListView.builder(
//           itemCount: controller.items.length,
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (context, i) {
//             return ProductsHome(
//                 productsModel: ProductsModel.fromJson(controller.items[i]));
//           }),
//     );
//   }
// }
//
// class ProductsHome extends StatelessWidget {
//   final ProductsModel productsModel;
//   const ProductsHome({Key? key, required this.productsModel}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           margin: const EdgeInsets.symmetric(horizontal: 10),
//           child: Image.network(
//             "${AppLink.imagestItems}/${productsModel.productsImage}",
//             height: 100,
//             width: 150,
//             fit: BoxFit.fill,
//           ),
//         ),
//         Container(
//           decoration: BoxDecoration(
//               color: Colors.black.withOpacity(0.3),
//               borderRadius: BorderRadius.circular(20)),
//           height: 120,
//           width: 200,
//         ),
//         Positioned(
//             left: 10,
//             child: Text(
//               "${productsModel.productsName}",
//               style: const TextStyle(
//                   color: Colors.white,
//                   // fontWeight: FontWeight.bold,
//                   fontSize: 14),
//             ))
//       ],
//     );
//   }
// }