import 'package:flutter/material.dart';
import 'package:star/src/Widgets/product/products_widget/reviews_ratings/ratingprogresslndicator.dart';
class OverallProductRating extends StatelessWidget {
  const OverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            "4.8",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.purple),
          ),
        ),
        Expanded(
          flex: 7,
          child: Column(
            children: [
              RatingProgresslndicator(text: '5',value: 1.0,),
              RatingProgresslndicator(text: '4',value: 0.8,),
              RatingProgresslndicator(text: '3',value: 0.6,),
              RatingProgresslndicator(text: '2',value: 0.4,),
              RatingProgresslndicator(text: '1',value: 0.2,),
              // يمكنك إضافة مزيد من الأسطر هنا إذا لزم الأمر
            ],
          ),
        )
      ],
    );
  }
}