import 'package:flutter/material.dart';
import 'package:star/src/Utils/app_dimensions.dart';

class CustomTitleHome extends StatelessWidget {
  final String title ;
  const CustomTitleHome({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.width10),
      child: Text(title,
          style:const  TextStyle(
              fontSize: 20,
              color: Colors.purple,
              fontWeight: FontWeight.bold)),
    );
  }
}