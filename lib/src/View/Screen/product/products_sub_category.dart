// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:star/src/View/Screen/product/produsctdetails.dart';
// import '../../../Controller/detalis_products_controller.dart';
// import '../../../Controller/produsct_controller.dart';
//
//
// class ProductsSubCategoryPage extends StatelessWidget {
//   final String category;
//
//   ProductsSubCategoryPage({required this.category});
//
//   @override
//   Widget build(BuildContext context) {
//     final ProductsController controller = Get.find();
//
//     // طلب تحميل المنتجات عند دخول الصفحة
//     controller.fetchProductsForCategory(category);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(category),
//       ),
//       body: Obx(() {
//         final products = controller.getProductsByCategory(category);
//
//         if (products.isEmpty) {
//           return Center(
//             child: Text(
//               'No products available in this category!',
//               style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.purple,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           );
//         } else {
//           return GridView.builder(
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               crossAxisSpacing: 10,
//               mainAxisSpacing: 10,
//               childAspectRatio: 0.5,
//             ),
//             itemCount: products.length,
//             itemBuilder: (context, index) {
//               final product = products[index];
//
//               return Card(
//                 elevation: 5,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Column(
//                     children: [
//                       Expanded(
//                         child: Hero(
//                           tag: 'productImage-${product.id}',
//                           child: Image.asset(
//                             product.imageUrl,
//                             fit: BoxFit.cover,
//                             width: double.infinity,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           product.name,
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.purple,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                         child: Text(
//                           '\$${product.price.toString()}',
//                           style: TextStyle(
//                             color: Colors.green,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       ElevatedButton(
//                         onPressed: () {
//                           final productDetailController = Get.put(ProductDetailController());
//                           productDetailController.setProduct(product);
//
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => ProductDetailPage(),
//                             ),
//                           );
//                         },
//                         child: Text('View Details'),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         }
//       }),
//     );
//   }
// }
