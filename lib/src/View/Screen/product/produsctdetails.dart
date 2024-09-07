// lib/views/product_detail_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:star/src/View/Screen/product/widget/product_reviews.dart';

import '../../../Controller/detalis_products_controller.dart';
import '../../../Controller/produsct_controller.dart';
import '../../../Model/productdetalis_model.dart';
import '../../../Utils/app_dimensions.dart';
import '../../../Utils/function/colors.dart';
import '../../../Widgets/product/bottom_add_to_car_widget.dart';
import '../../../Widgets/product/choice_chip.dart';

class ProductDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductDetailController controller = Get.put(ProductDetailController());

    return Obx(() {
      final product = controller.selectedProduct.value;

      return Scaffold(
        bottomNavigationBar: BottomAddToCard(),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite),
              color: Colors.red,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //1 Product Image Slider
              ClipPath(
                child: Container(
                  child: Stack(
                    children: [
                      SizedBox(
                        height: Dimensions.height10 * 40,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                           child: Center(
                            child: Hero(
                              tag: 'productImage-${product.id}',
                              child: Image.asset(
                                product.imageUrl,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 300,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        left: 24,
                        child: SizedBox(
                          height: Dimensions.height10 * 8,
                          child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              physics: AlwaysScrollableScrollPhysics(),
                              itemBuilder: (_, index) =>
                                  RoundedImage(
                                    width: 80,
                                    backgroundColor: Colors.white,
                                    border: Border.all(color: Colors.grey),
                                    padding: EdgeInsets.all(8.0),
                                    imageUrl: 'assets/images/lap1.png',
                                  ),
                              separatorBuilder: (_, __) =>
                                  SizedBox(
                                    width: Dimensions.width20,
                                  ),
                              itemCount: 6),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // 2 Product Details
              SizedBox(
                height: Dimensions.height10,
              ),
              Padding(
                padding: EdgeInsets.only(right: 16, left: 16, bottom: 16),
                child: Column(
                  children: [
                    // Rating & Share Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Rating
                        Row(
                          children: [
                            Icon(
                              Icons.stars,
                              color: Colors.amber,
                              size: 30,
                            ),
                            SizedBox(
                              width: Dimensions.width10,
                            ),
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                text: '5.0',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                  text: '(199)',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold))
                            ]))
                          ],
                        ),
                        //Share Button
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.share,
                              size: 30,
                              color: Colors.black87,
                            ))
                      ],
                    ),
                    // price , title , stock
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //price & sale tag
                        Row(
                          children: [
                            // sale tag
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.height10 - 5,
                                  vertical: Dimensions.width15 - 5),
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(Dimensions.radius15),
                                color: Colors.amber[300],
                              ),
                              child: Text(
                                "25%",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                            SizedBox(
                              width: Dimensions.width15,
                            ),
                            //price
                            Text(
                              "\$250",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.lineThrough),
                            ),
                            SizedBox(
                              width: Dimensions.width15,
                            ),
                            Text("\$175",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        //title
                        Text(
                          "laptop hp",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(
                          height: Dimensions.height10 - 5,
                        ),
                        // stock
                        Row(
                          children: [
                            Text(
                              "Status  ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            SizedBox(
                              width: Dimensions.width15,
                            ),
                            Text(
                              "In Stock",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.height10 - 5,
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius:
                              BorderRadius.circular(Dimensions.radius20)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Variation",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: Dimensions.width15,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Price",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.grey[800]),
                                          ),
                                          SizedBox(
                                            width: Dimensions.width15,
                                          ),
                                          Text(
                                            "\$25",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                decoration:
                                                TextDecoration.lineThrough),
                                          ),
                                          SizedBox(
                                            width: Dimensions.width15,
                                          ),
                                          Text(
                                            "\$20",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Stock",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.grey[800]),
                                          ),
                                          SizedBox(
                                            width: Dimensions.width15,
                                          ),
                                          Text(
                                            "In Stock",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              //Variation Description
                              Text(
                                "Description 4 max line",
                                maxLines: 4,
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              // Attribute
              SizedBox(
                height: Dimensions.height10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Colors",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Wrap(
                    spacing: 8,
                    children: [
                      CustomChoiceChip(
                        text: 'Green',
                        selected: true,
                        onSelected: (value) {},
                      ),
                      CustomChoiceChip(
                          text: 'Blue',
                          selected: false,
                          onSelected: (value) {}),
                      CustomChoiceChip(
                          text: 'Black',
                          selected: false,
                          onSelected: (value) {}),
                      CustomChoiceChip(
                        text: 'Pink',
                        selected: false,
                        onSelected: (value) {},
                      ),
                      CustomChoiceChip(
                          text: 'Yellow',
                          selected: false,
                          onSelected: (value) {}),
                      CustomChoiceChip(
                          text: 'Red', selected: false, onSelected: (value) {}),
                      CustomChoiceChip(
                          text: 'Purple',
                          selected: false,
                          onSelected: (value) {}),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Size",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Wrap(
                    spacing: 8,
                    children: [
                      CustomChoiceChip(
                          text: 'XS', selected: true, onSelected: (value) {}),
                      CustomChoiceChip(
                          text: 'S', selected: false, onSelected: (value) {}),
                      CustomChoiceChip(
                          text: 'M', selected: false, onSelected: (value) {}),
                      CustomChoiceChip(
                          text: 'L', selected: false, onSelected: (value) {}),
                      CustomChoiceChip(
                          text: 'XL', selected: false, onSelected: (value) {}),
                      CustomChoiceChip(
                          text: 'XXL', selected: false, onSelected: (value) {}),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.height15,
                  )
                ],
              ),
              //check button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Colors.grey[200]),
                  ),
                  child: Text('Checkout'),
                ),
              ),
              SizedBox(
                height: Dimensions.height15,
              ),
              Text(
                "Description",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              ReadMoreText(
                "hsakhduhdshfdicfjfdhsdkjhfdskhfhfdkjsh jkfkdshfksdkjf jfdkjsfkdshj sdjflkfdskj sldjlcjdslj hdsusjfdygfuydgfudyfgdfduyfgdufuydjshjfejfoefujjkffuoiufrugfrufgu",
                trimLines: 2,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Show more',
                trimExpandedText: 'Less',
                moreStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Colors.red),
                lessStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Colors.red),
              ),
              //Reviews
              Divider(),
              SizedBox(
                height: Dimensions.height20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Reviews(199)",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () => Get.to(ProductReviews()),
                      icon: Icon(
                        Icons.arrow_right_outlined,
                        size: 20,
                      )),
                ],
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
            ],
          ),
        ),
      );
    }
    );
  }
}
