import 'package:flutter/material.dart';

class CustomTextSingUpOrSingIn extends StatelessWidget {
  final String textone;
  final String texttwo;
  final void Function() onTap;
  const CustomTextSingUpOrSingIn ({super.key, required this.textone, required this.texttwo, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textone),
        InkWell(
          onTap: onTap,
          child: Text(texttwo, style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold),),)
      ],
    );
  }
}
