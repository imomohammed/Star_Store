import 'package:flutter/material.dart';
import 'package:star/src/Utils/app_dimensions.dart';
import 'package:star/src/Widgets/round_cantainer.dart';
import 'package:star/src/Widgets/t_appbar.dart';

import '../cart/widget/cart_item_widget.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Order Review',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.black87,
          ),
        ),
        showBackArrow: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            // استخدم Expanded لضبط ارتفاع CartItemWidget تلقائيًا
            Expanded(
              child: CartItemWidget(showAddRemoveButtons: false),
            ),
            SizedBox(height: Dimensions.height10),

            /// coupon TextField
            TRoundedContainer(
              showBorder: true,
              padding: EdgeInsets.only(
                  top: 8, bottom: 8, right: 8, left: 18),
              child: Row(
                children: [
                  ///TextFormField
                  Flexible(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Have a promo code? Enter here',
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder:InputBorder.none
                      ),
                    ),
                  ),
                  ///boutton
                  ElevatedButton(onPressed: (){}, child: Text('Apply',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),style: ElevatedButton.styleFrom(// لون النص والأيقونة (إذا كانت موجودة)
                    backgroundColor: Colors.black45,),)
                ],
              ),
            ),
            SizedBox(height: Dimensions.height10,),

            /// Billing Section
            TRoundedContainer(
              showBorder: true,
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  /// pricing
                  Column(
                    children: [
                      ///subTotal
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('SubTotal',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 18),),
                          Text('\$35',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 20),),
                        ],
                      ),
                      /// Discount
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Discount',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 18),),
                          Text('\$5',style: TextStyle(color: Colors.black87,fontSize: 18),),
                        ],
                      ),
                      /// Order Total
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Order Total',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 18),),
                          Text('\$30',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 22),),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: Dimensions.height10,),

                  /// Divider
                  Divider(),
                  SizedBox(height: Dimensions.height10,),
                  ///address
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Address', maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.black87,fontSize: 18,fontWeight: FontWeight.bold),),
                          TextButton(onPressed: (){}, child: Text('Chanage',style: TextStyle(color: Colors.grey),)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Ayha Street', maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      SizedBox(height: Dimensions.height10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.phone,color: Colors.grey,size: 16,),
                          SizedBox(width: Dimensions.width10,),
                          Expanded(
                            child: Text('777 777 777', maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                      SizedBox(height: Dimensions.height10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.location_history,color: Colors.grey,size: 16,),
                          SizedBox(width: Dimensions.width10,),
                          Expanded(
                            child: Text('Ayha Street', maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ],
                  )


                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
