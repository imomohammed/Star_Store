import 'package:flutter/material.dart';

import '../../../../Utils/app_dimensions.dart';


class RatingProgresslndicator extends StatelessWidget {
  const RatingProgresslndicator({
    super.key, required this.text, required this.value,
  });
  final String text;
  final double value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1,child: Text(text,style: TextStyle(fontWeight: FontWeight.bold),)),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: Dimensions.width15*0.8,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 11,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation(Colors.purple),
              borderRadius: BorderRadius.circular(Dimensions.radius20),
            ),
          ),
        )
      ],
    );
  }
}