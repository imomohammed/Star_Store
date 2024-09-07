import 'package:flutter/material.dart';

class CustomTextTitleAuth extends StatelessWidget {
  final String text;
  const CustomTextTitleAuth({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Text(text, textAlign: TextAlign.center,style: TextStyle(color: Colors.black54,fontSize: 25,fontWeight: FontWeight.bold),);
  }
}
