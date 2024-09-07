// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:star/src/Utils/app_dimensions.dart';
//
// import '../product/product_card_horizontal.dart';
//
// class SubCategoryScreen extends StatelessWidget {
//   const SubCategoryScreen({super.key, required this.subCategory});
//   final String subCategory;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Women'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ``````Container(
//                 width: Dimensions.width10 * 50,
//                 height: Dimensions.height10 * 20,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(Dimensions.radius20),
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(Dimensions.radius20),
//                   child: Image.asset(
//                     "assets/images/fash.png",
//                     width: double.infinity,
//                     height: double.infinity,
//                     fit: BoxFit.cover,
//                   ),``````
//                 ),
//               ),
//               //SizedBox(height: Dimensions.height10,),
//               //Sub_categories
//               SizedBox(height: Dimensions.height10,),
//               Container(
//                 padding: EdgeInsets.all(1),
//                 width: Dimensions.width10*50,
//                 height: Dimensions.height10*20,
//                 decoration: BoxDecoration(
//                   //color: Colors.grey,
//                   borderRadius: BorderRadius.circular(Dimensions.radius20)
//                 ),
//                  child: ListView.builder(
//     itemCount: 6,
//     scrollDirection: Axis.horizontal,
//     itemBuilder: (_, index){
//     return Row(
//     children: [
//     Container(
//     margin: EdgeInsets.symmetric(horizontal: Dimensions.height10),
//     padding: EdgeInsets.symmetric(
//     vertical: Dimensions.width10 - 5,
//     horizontal: Dimensions.height10,
//     ),
//     decoration: BoxDecoration(
//     color: Colors.purple[200],
//     borderRadius: BorderRadius.circular(Dimensions.radius20),
//     ),
//     child: Row(
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: [
//     ClipOval(
//     child: Image.asset(
//     'assets/images/girl2.png',
//     fit: BoxFit.cover,
//     width: Dimensions.width45 - 5,
//     height: Dimensions.height45 - 5,
//     ),
//     ),
//       SizedBox(height: 4), // تقليل الفراغ العمودي بين الصورة والنص
//       SizedBox(
//           width: Dimensions.width45+10,
//           child:TextButton(
//             onPressed: () =>Get.to(()=> SubCategoryScreen(subCategory: subCategory,)),
//             child: Text(
//               'shoes',
//               style: TextStyle(
//                 color: Colors.purple,
//                 fontSize: 14,
//               ),
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               textAlign: TextAlign.center, // محاذاة النص في الوسط
//             ),
//             style: ButtonStyle(
//               alignment: Alignment.center, // توسيط محتويات الزر
//             ),
//           )
//
//       ),
//                 //
//                 // Column(
//                 //   crossAxisAlignment: CrossAxisAlignment.start,
//                 //   children: [
//                 //     TextButton(child: Text("Dress",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),onPressed: (){},),
//                 //
//                 //    // SizedBox(height: Dimensions.height10,),
//                 //   //  ProductCardHorizontal()
//                 //
//                 //   ],
//                 // ),
//               ])
//       )],
//
//                 );
//     }),
//         ),
//     ]),
//     )
//     )
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:star/src/Utils/app_dimensions.dart';
import 'package:star/src/View/Screen/product/produsctdetails.dart';
import '../../../Controller/detalis_products_controller.dart';
import '../../../Controller/produsct_controller.dart';
import '../sub_category/sub_category.dart';

class SubCategoryScreen extends StatefulWidget {
  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  final ProductsController controller = Get.put(ProductsController());

  late String subCategory;

  @override
  void initState() {
    super.initState();

    // استرجاع الفئة الفرعية من الحجج
    subCategory = Get.arguments ?? controller.categories[0];

    // تحميل المنتجات للفئة الفرعية المختارة
    controller.getProductsBySubCategory(subCategory);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Electronics',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black54,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Subcategory image section
            Padding(
              padding: const EdgeInsets.all(1),
              child: Container(
                width: Dimensions.width10 * 30,
                height: Dimensions.height10 * 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  child: Image.asset(
                    controller.subCategoryImages[subCategory] ?? 'assets/images/camera1.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // Subcategories section
            Container(
              height: Dimensions.height20 * 9,
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Obx(() {
                if (controller.isLoadingSubCategories.value) {
                  return Center(child: CircularProgressIndicator());
                }

                final subCategories = controller.subCategories[subCategory] ?? [];
                if (subCategories.isEmpty) {
                  return Center(child: Text('No subcategories available'));
                }

                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: subCategories.map((subCategory) {
                      return GestureDetector(
                        onTap: () {
                          controller.getProductsBySubCategory(subCategory);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          width: 120,
                          child: InkWell(
                            onTap: () => Get.to(() => SubCategoryScreen()),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                    controller.subCategoryImages[subCategory] ?? 'assets/images/default.png',
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  subCategory,
                                  style: TextStyle(fontSize: 14, color: Colors.black54),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                );
              }),
            ),

            // Products section
            Obx(() {
              if (controller.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black54),
                  ),
                );
              } else {
                final products = controller.getProductsBySubCategory(subCategory);

                if (products.isEmpty) {
                  return Center(
                    child: Text(
                      'No products available in this subcategory!',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                } else {
                  // تحديد ارتفاع محدد لـ GridView
                  return Container(
                    height: MediaQuery.of(context).size.height - kToolbarHeight - 300, // يمكنك ضبط الارتفاع حسب الحاجة
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.5,
                      ),
                     // physics: const NeverScrollableScrollPhysics(),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        final isEvenIndex = index % 2 == 0;

                        double height = isEvenIndex ? 200.0 : 100.0;

                        return Card(
                          elevation: 5,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radius20),
                            ),
                            height: height,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Hero(
                                    tag: 'productImage-${product.id}',
                                    child: Image.asset(
                                      product.imageUrl,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    product.name,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    '\$${product.price.toString()}',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                ElevatedButton(
                                  onPressed: () {
                                    final productDetailController = Get.put(ProductDetailController());
                                    productDetailController.setProduct(product);

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProductDetailPage(),
                                      ),
                                    );
                                  },
                                  child: Text('View Details'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              }
            }),
          ],
        ),
      ),
    );
  }
}
