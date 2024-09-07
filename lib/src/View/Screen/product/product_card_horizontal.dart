import 'package:flutter/material.dart';
import 'package:star/src/Utils/app_dimensions.dart';

import '../../../Model/productdetalis_model.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.width10 * 31,
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius20),
      ),
      child: Row(
        children: [
          Container(
            height: Dimensions.height20 * 6,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
            ),
            child: Stack(
              children: [
                SizedBox(
                  width: Dimensions.width10 * 12,
                  height: Dimensions.height10 * 12,
                  child: RoundedImage(
                    imageUrl: 'assets/images/fash.png',
                    applyImageRadius: true,
                  ),
                ),
                // sale tag
                Positioned(
                  top: 12,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.height10 - 2,
                        vertical: Dimensions.width10 - 6),
                    child: Container(
                      padding: EdgeInsets.all(2),
                      width: Dimensions.width45,
                      height: Dimensions.height30 - 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20 * 5),
                        color: Colors.amber,
                      ),
                      child: Text(
                        "25%",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                // favorite icon button
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20 * 5),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border, color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Details
          SizedBox(
            width: Dimensions.width10 * 16.5, // تقليل العرض قليلاً
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "fashin marka",
                        style: TextStyle(
                          fontSize: 16, // ضبط حجم الخط حسب الحاجة
                        ),
                        maxLines: 1, // الحد الأقصى للأسطر
                        overflow: TextOverflow.ellipsis, // قطع النص عند تجاوز العرض المتاح
                        softWrap: false, // منع التفاف النص
                      ),
                      SizedBox(height: Dimensions.height10),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$255"),

                    //add to cart
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radius15),
                          bottomRight: Radius.circular(Dimensions.radius20),

                        ),
                      ),
                      child: SizedBox(
                        width: Dimensions.width45,
                        height: Dimensions.height45,
                        child: Center(
                          child: Icon(Icons.add,color: Colors.white,),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );

  }
}
