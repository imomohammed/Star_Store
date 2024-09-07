import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:star/src/Utils/app_dimensions.dart';
import 'package:star/src/Utils/style/shadow_style.dart';
import 'package:star/src/View/Screen/product/produsctdetails.dart';
import 'package:star/src/Widgets/images/t_round_images_widget.dart';

import '../../../Utils/images.dart';
import '../../../Widgets/icons/circular_icon.dart';
import '../../../Widgets/round_cantainer.dart';
import '../../../Widgets/text/products_title_text.dart';

class TProductCarVertical extends StatelessWidget {
  const TProductCarVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(()=> ProductDetailPage());
      },
      child: Container(
        width: Dimensions.width20 * 10,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(Dimensions.radius15),
        ),
        child: Column(
          children: [
            ///Thumbnail , wishlist button, discount tag
            TRoundedContainer(
              height: Dimensions.height10 * 18,
              padding: EdgeInsets.all(8),
              child: Stack(
                ///Thumbnail
                children: [
                  TRoundedImage(
                    width: 180,
                    height: 180,
                    imageUrl: TImages.products9,
                    applyImageRadius: true,
                  ),

                  ///sale tag
                  Positioned(
                    top: 8,
                    left: 8,
                    child: TRoundedContainer(
                      radius: 16,
                      backgroundColor: Colors.yellow.withOpacity(0.8),
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.height10 - 2,
                          vertical: Dimensions.width10 - 6),
                      child: Text(
                        '25%',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    ),
                  ),

                  ///favorite icon button
                  Positioned(
                      top: 0,
                      right: 0,
                      child: TCircularIcon(icon: Icons.favorite,color: Colors.red)),
                ],
              ),
            ),

            /// Details
            SizedBox(
              height: Dimensions.height10,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.height10),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TProductTitleText(title: 'jsdcjksd jdscjksdhcj',),
                    SizedBox(height: Dimensions.height10,),
                    Row(
                      children: [
                        Text('Girl',style: TextStyle(fontSize: 14,color: Colors.black45,fontWeight: FontWeight.bold),)
                      ],
                    ),
                    /// price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$35',maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),

                    ///add to cart button
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radius15-3),
                          bottomRight: Radius.circular(Dimensions.radius15+1),
                        ),
                      ),
                      child: SizedBox(
                        width: Dimensions.iconDize30+10,
                          height: Dimensions.iconDize30+10,
                          child: Center(child: Icon(Icons.add,color: Colors.white,))),
                    )
],),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


