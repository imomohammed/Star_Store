import 'package:flutter/material.dart';
import 'package:star/src/Utils/app_dimensions.dart';

class TOrderListItem extends StatelessWidget {
  const TOrderListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_,__)=>SizedBox(height: Dimensions.height30,),
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder:(_,index) => Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(color: Colors.transparent,
        border: Border.all(),borderRadius: BorderRadius.circular(Dimensions.radius20)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                //Icon
                Icon(Icons.local_shipping),
                SizedBox(width: Dimensions.width10,),

                //status & Date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Processing', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.grey
                      ),),
                      Text('02 Nov ,2024', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.purple
                      ),),
                    ],
                  ),
                ),
                //Icon
                IconButton(onPressed: (){}, icon: Icon(Icons.arrow_right_outlined,size: 32,))

              ],
            ),
            SizedBox(height: Dimensions.height20,),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      //Icon
                      Icon(Icons.shop),
                      SizedBox(width: Dimensions.width10,),

                      //status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.grey
                            ),),
                            Text('31287', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.purple
                            ),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      //Icon
                      Icon(Icons.calendar_month),
                      SizedBox(width: Dimensions.width10,),

                      //status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Shipping Data', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.grey
                            ),),
                            Text('03 Nov ,2024', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.purple
                            ),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
