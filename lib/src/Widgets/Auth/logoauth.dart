import 'package:flutter/material.dart';
import 'package:star/src/Utils/images.dart';


class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Image.asset(TImages.logo),
    );
  }
}
