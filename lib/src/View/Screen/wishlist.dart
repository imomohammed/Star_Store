import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:star/src/View/Screen/product/product_car_vertical.dart';
import 'package:star/src/Widgets/layouts/grid_layout.dart';

import '../../Widgets/icons/circular_icon.dart';
import '../../Widgets/t_appbar.dart';
import 'home/home.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Favorites',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.black87),),
        actions: [
          TCircularIcon(icon: Icons.add, onPressed: ()=> Get.to(HomeScreen()),)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              TGridLayout(itemCount: 8, itemBuilder: (_,index)=> TProductCarVertical())
            ],
          ),
        ),
      ),
    );
  }
}
