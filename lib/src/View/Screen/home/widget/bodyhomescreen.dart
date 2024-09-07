import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:star/src/Utils/app_dimensions.dart';
import 'package:star/src/Utils/images.dart';
import 'package:star/src/View/Screen/home/widget/promo_slider.dart';
import 'package:star/src/View/Screen/product/produsct.dart';
import 'package:star/src/Utils/app_dimensions.dart';
import '../../../../Controller/categories_controller.dart';
import '../../../../Controller/favoritescontroller.dart';
import '../../../../Model/produsct_model.dart';
import '../../../../Widgets/circular_cantainer.dart';
import '../../../../Widgets/images/t_round_images_widget.dart';
import '../../../../Widgets/layouts/grid_layout.dart';
import '../../product/all_product.dart';
import '../../product/product_car_vertical.dart';
import '../home_category.dart';

class BodyHomeScreen extends StatefulWidget {
  const BodyHomeScreen({super.key});

  @override
  State<BodyHomeScreen> createState() => _BodyHomeScreenState();
}

class _BodyHomeScreenState extends State<BodyHomeScreen> {
  late final ProductModel product;  // هنا يتم تعريف المنتج

 // ProductDetailPage({required this.product});
  final CategoriesController categoriesController = Get.put(CategoriesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.purple[50],
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
       // backgroundColor: Colors.purple[50],
        title: Center(
          child: Text(
            "Star Store",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.height15),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black87,
                        ),
                        hintText: "Find Product",
                        hintStyle:
                            TextStyle(color: Colors.black26, fontSize: 18),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20)),
                        filled: true,
                        fillColor: Colors.black12,
                      ),
                    )),
                    SizedBox(
                      width: Dimensions.width10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20 - 10),
                        color: Colors.black12,
                      ),
                      width: Dimensions.width20 * 3,
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications_active_outlined,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              /// slider
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    TPromoSlider(banners: [TImages.banners1,TImages.banners2,TImages.banners3],),
                  ],
                )

              ),

              /// catagory
           //   SizedBox(height: Dimensions.height10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // لضبط العناصر بشكل مناسب
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Category',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Text(
                        //   'Show All ->',
                        //   style: TextStyle(
                        //     color: Colors.purple,
                        //     fontSize: 16,
                        //   ),
                        // ),
                        // IconButton(onPressed: ()=>Get.to(ProductPage(subCategory: '',)), icon: Icon(Icons.arrow_right_outlined,size: 30,color: Colors.purple,))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(onPressed: ()=>Get.to(ProductsPage()), child: Text('view all',style: TextStyle(color: Colors.black),))
                            //IconButton(onPressed: ()=>Get.to(ProductsPage()), icon: Icon(Icons.arrow_right_outlined,size: 30,color: Colors.black,)),
                          ],
                        )

                      ],
                    ),
                    SizedBox(
                      height: 120, // تحديد ارتفاع لقائمة التمرير الأفقية
                      child: HomeCategory()
                    ),
                    SizedBox(height: Dimensions.height10-5), // إضافة مساحة بين الأقسام
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Produsct',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(onPressed: ()=>Get.to(AllProduct()), child: Text('view all',style: TextStyle(color: Colors.black))),
                      ],
                    ),
                    ///product home
                    TGridLayout(
                        itemCount: 4, itemBuilder: (_,index)=> TProductCarVertical())

                      ]),
                    ),
    ])
    )
    );

  }
}



