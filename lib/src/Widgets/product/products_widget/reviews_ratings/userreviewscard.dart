import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:star/src/Utils/app_dimensions.dart';

import '../ratings_widget.dart';

class UserReviewsCard extends StatelessWidget {
  const UserReviewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/user.png"),
                ),
                SizedBox(width: Dimensions.width10,),
                Text("Eman Mohammed",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
              ],
            ),
            IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))
          ],
        ),
        SizedBox(width: Dimensions.width10,),
        //Reviews
        Row(
          children: [
            TRatingBarIndicator(rating: 4,),
            SizedBox(width: Dimensions.width10,),
            Text('01 Nov , 2024' , style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),)
          ],
        ),
        SizedBox(height: Dimensions.height10,),
        ReadMoreText('jdfsfh djfnskhfdsjkcxlzjcj kjdsckldzsjcld dskjcdklsjc k djsfcdhscjkdscfhjdskh jdkshcdjskhfcdjskhf jfcdskfhdjsfhdsjkf jdsfhdsjkfhdjhf dsjkdsfkdsjsda',
        trimLines:1,
          trimMode: TrimMode.Line,
          trimExpandedText: 'Show less',
          trimCollapsedText: 'Show more',
          moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.purple),
          lessStyle:TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.purple),
        ),
        SizedBox(height: Dimensions.height10,),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[350],
            borderRadius: BorderRadius.circular(Dimensions.radius15),
          ),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Star Store',style: TextStyle(color: Colors.purple,fontSize: 18,fontWeight: FontWeight.bold),),
                    Text('02 Nov , 2024',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),),

                  ],
                ),
                ReadMoreText('jdfsfh djfnskhfdsjkcxlzjcj kjdsckldzsjcld dskjcdklsjc k djsfcdhscjkdscfhjdskh jdkshcdjskhfcdjskhf jfcdskfhdjsfhdsjkf jdsfhdsjkfhdjhf dsjkdsfkdsjsda',
                  trimLines:1,
                  trimMode: TrimMode.Line,
                  trimExpandedText: 'Show less',
                  trimCollapsedText: 'Show more',
                  moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.purple),
                  lessStyle:TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.purple),
                ),
                SizedBox(height: Dimensions.height20,),
              ],
            ),
          ),
        )
      ],
    );
  }
}
