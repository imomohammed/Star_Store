import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:star/src/Utils/app_dimensions.dart';

import '../../../../Widgets/product/products_widget/ratings_widget.dart';
import '../../../../Widgets/product/products_widget/reviews_ratings/reviews_rating_widget.dart';
import '../../../../Widgets/product/products_widget/reviews_ratings/userreviewscard.dart';

class ProductReviews extends StatelessWidget {
  const ProductReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reviews & Ratings",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Ratings and reviews are verified and are from people who use the same type of device that you use"),
              SizedBox(height: Dimensions.height10),
              // Overall Product Ratings
              OverallProductRating(),
              TRatingBarIndicator(rating: 3.5,),
              Text("12,611", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.grey),),
              SizedBox(height: Dimensions.height30,),
              //User Reviews List
              UserReviewsCard(),
              UserReviewsCard(),
              UserReviewsCard(),
              UserReviewsCard(),

            ],
          ),
        ),
      ),
    );
  }
}





