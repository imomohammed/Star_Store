import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star/src/Utils/app_dimensions.dart';

class BottomAddToCard extends StatelessWidget {
  const BottomAddToCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.height20-2,vertical: Dimensions.width10-2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.radius20),
          topRight: Radius.circular(Dimensions.radius20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.grey
                ),
                child:  Icon(
                  CupertinoIcons.minus,
                  size: 30,
                  color: Colors.white,
                ),),
              SizedBox(width: Dimensions.width10,),
              Text("2",style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(width: Dimensions.width10,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.black
                ),
                child:  Icon(
                  CupertinoIcons.plus,
                  size: 30,
                  color: Colors.white,
                ),),
            ],
          ),
          SizedBox(width: Dimensions.width10,),
          ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(8),
            backgroundColor: Colors.grey[200],
            side: BorderSide(color: Colors.grey)
          ),child: Text('Add to Cart',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 20),))
        ],
      ),
    );
  }
}
