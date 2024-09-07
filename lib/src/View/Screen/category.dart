// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../Controller/categories_controller.dart';
// import '../../Utils/app_dimensions.dart';
// import 'home/widget/bottomnavigationbar.dart';
//
//
// class CategoriesScreen extends StatelessWidget {
//   final CategoryController controller = Get.put(CategoryController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Text(
//             "Categories",
//             style: TextStyle(
//               color: Colors.purple,
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.only(top: 10, left: 10, right: 10),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       prefixIcon: Icon(
//                         Icons.search,
//                         color: Colors.purple,
//                       ),
//                       hintText: "Find Product",
//                       hintStyle: TextStyle(
//                         color: Colors.purple[100],
//                         fontSize: 18,
//                       ),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide.none,
//                         borderRadius: BorderRadius.circular(20), // Adjust as needed
//                       ),
//                       filled: true,
//                       fillColor: Colors.grey[200],
//                     ),
//                   ),),
//                  SizedBox(width: Dimensions.width10,),
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(Dimensions.radius20-10),
//                       color: Colors.grey[200],
//                     ),
//
//                     width: Dimensions.width20*3,
//                     padding: EdgeInsets.symmetric(vertical: 8),
//                     child: IconButton(onPressed: (){},icon: Icon(Icons.shopping_cart_checkout, size: 30,color: Colors.purple,),),)
//                   ],
//                 ),
//     ),
//
//           Expanded(
//             child: Obx(() {
//               return ListView.builder(
//                 itemCount: controller.categories.length,
//                 itemBuilder: (context, index) {
//                   final category = controller.categories[index];
//                   return ExpansionTile(
//                     leading: CircleAvatar(
//                       backgroundImage: AssetImage(category.imageUrl), // عرض الصورة
//                     ),
//                     title: Text(category.name,style: TextStyle(color: Colors.purple,fontSize: 20,fontWeight: FontWeight.bold),),
//                     children: category.subCategories.map((subCategory) {
//                       return ListTile(
//                         leading: CircleAvatar(
//                           backgroundImage: AssetImage(subCategory.imageUrl), // عرض صورة الفئة الفرعية
//                         ),
//                         title: Text(subCategory.name,style: TextStyle(color: Colors.purple[200],fontSize: 18,fontWeight: FontWeight.bold)),
//                         onTap: () => controller.goToProductsByCategory(subCategory),
//                       );
//                     }).toList(),
//                   );
//                 },
//               );
//             }),
//           ),
//         ],
//       ),
//     );
//   }
// }
