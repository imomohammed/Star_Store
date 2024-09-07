import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../Controller/homescreen_controller.dart';
import '../../../../Utils/app_dimensions.dart';
import '../../../../Utils/images.dart';
import '../../../../Widgets/circular_cantainer.dart';
import '../../../../Widgets/images/t_round_images_widget.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key, required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
   final controller =Get.put(HomeScreenControllerImp());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              viewportFraction: 1,
            onPageChanged: (index,_)=> controller.updatePageIndicator(index)
          ),
          items: banners.map((url) => TRoundedImage(width: 320,imageUrl: url)).toList()
        ),
        SizedBox(height: Dimensions.height20,),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for( int i=0; i< banners.length; i++)
                  TCircularCantainer(
                    width: 20,
                    height: 4,
                    margin: EdgeInsets.only(right: 10),
                    backgroundColor: controller.carousalCurrentIndex.value == i ? Colors.black : Colors.grey,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

