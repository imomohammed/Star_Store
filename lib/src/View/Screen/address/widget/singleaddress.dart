  import 'package:flutter/material.dart';
import 'package:star/src/Utils/app_dimensions.dart';
class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius20),
        color: selectedAddress ? Colors.purple.withOpacity(0.5) : Colors.grey.withOpacity(0.2),

      ),
      width: double.infinity,
    child: Stack(
      children: [
        Positioned(
          right: 5,
          top: 0,
          child: Icon(
              selectedAddress ? Icons.check_circle_outlined :null,),
        ),
        //SizedBox(height: Dimensions.height30,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Eman Mohammed',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
            SizedBox(height: Dimensions.height10,),
            Text('(+967) 777 777 777',maxLines: 1,overflow: TextOverflow.ellipsis,),
            SizedBox(height: Dimensions.height10,),
            Text('76876876 ,Timhhjgj ,0898 ,jhhh',softWrap: true,),

          ],
        )
      ],
    ),
    );
  }
}
