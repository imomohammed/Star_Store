import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star/src/Utils/app_dimensions.dart';
import 'package:star/src/Utils/images.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for(int i=1; i< 8; i++)
          Container(
            margin: EdgeInsets.symmetric(horizontal:6 ),
            padding: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: Colors.purple[100],
              borderRadius: BorderRadius.circular(Dimensions.radius20)
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Image.asset(TImages.logo, width: 40, height: 40,),
                  const Text("Women", style: TextStyle(fontSize: 14, color: Colors.purple, fontWeight: FontWeight.bold),)
              ],),
            ),
          )
        ],
      ),
    );
  }
}
