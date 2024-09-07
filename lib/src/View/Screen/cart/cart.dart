import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:star/src/Utils/app_dimensions.dart';
import 'package:star/src/View/Screen/cart/product_cart_add_remove_button.dart';
import 'package:star/src/View/Screen/cart/widget/cart_item_widget.dart';
import 'package:star/src/View/Screen/checkout/checkout.dart';
import 'package:star/src/Widgets/icons/circular_icon.dart';
import '../../../Widgets/t_appbar.dart';
import 'cart_item.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Cart',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.black87,
          ),
        ),
        showBackArrow: true,
      ),
      body: Container(
        height: double.infinity,
      //  color: Colors.blue,
        child: Stack(
          children: [
            Container(
              //color: Colors.red,
              child: Padding(
                padding: EdgeInsets.all(24),
                child: CartItemWidget(),
              ),
            ),

            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                width: double.infinity,
                height: Dimensions.height20*7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.borderRadius15),
                  color: Colors.grey[200],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Total: \$35"),
                          Text("Descount: \$5"),
                          Text("Subtotal: \$30"),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: ()=>Get.to(()=> CheckOut()),child: Text('Checkout', style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),style: ElevatedButton.styleFrom(// لون النص والأيقونة (إذا كانت موجودة)
                        backgroundColor: Colors.black87,),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}

