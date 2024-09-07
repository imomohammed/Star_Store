import 'package:flutter/material.dart';
import '../../../../Utils/app_dimensions.dart';
import '../cart_item.dart';
import '../product_cart_add_remove_button.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: Dimensions.height30 * 15,  // تحديد ارتفاع مناسب حسب الحاجة
      child: ListView.separated(
        separatorBuilder: (_, __) => SizedBox(height: Dimensions.height30),
        itemCount: 10 ,
        itemBuilder: (_, index) => Column(
          children: [
            TCartItem(),
            if (showAddRemoveButtons)
              SizedBox(height: Dimensions.height10),
            if (showAddRemoveButtons)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: Dimensions.width10 * 7),
                      /// زر الإضافة والإزالة
                      TProductQuantityAddRwmoveButton(),
                    ],
                  ),
                  Text(
                    '\$35',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
