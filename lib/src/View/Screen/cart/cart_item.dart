import 'package:flutter/material.dart';

import '../../../Utils/app_dimensions.dart';
import '../../../Utils/images.dart';
import '../../../Widgets/images/t_round_images_widget.dart';
import '../../../Widgets/text/products_title_text.dart';
class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// image
        TRoundedImage(imageUrl: TImages.products9,
          width: Dimensions.width10*6,
          height: Dimensions.height10*6,
          padding: EdgeInsets.all(8),
        ),
        SizedBox( width: Dimensions.width10,),

        /// title , price , size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('categories'),
              Flexible(child: TProductTitleText(title: 'Black camera' , maxLines: 1,)),

              /// Attributes
              Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(text: 'Color ', style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.bold)),
                        TextSpan(text: 'Black ', style: TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.bold)),
                        TextSpan(text: 'Size ', style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.bold)),
                        TextSpan(text: '2 ', style: TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.bold)),

                      ]
                  ))
            ],
          ),
        )
      ],
    );
  }
}