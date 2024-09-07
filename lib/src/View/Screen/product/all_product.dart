import 'package:flutter/material.dart';
import 'package:star/src/Utils/app_dimensions.dart';
import 'package:star/src/View/Screen/product/product_car_vertical.dart';
import 'package:star/src/Widgets/layouts/grid_layout.dart';
import 'package:star/src/Widgets/t_appbar.dart';

class AllProduct extends StatelessWidget {
  const AllProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Popular Products',
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              ///Dropdowm
              DropdownButtonFormField(
                decoration: InputDecoration(prefixIcon: Icon(Icons.store)),
                onChanged: (value) {},
                items: ['Name', ' Higher Price', 'Lower Price']
                    .map((option) => DropdownMenuItem(value:option,child: Text(option)))
                    .toList(),
              ),
              SizedBox(height: Dimensions.height10,),
              TGridLayout(
                  itemCount: 10,
                  itemBuilder: (_,index)=> TProductCarVertical())
            ],
          ),
        ),
      ),
    );
  }
}
