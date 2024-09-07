
import 'package:flutter/material.dart';

class CustomBouttomAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomBouttomAuth({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
        child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.symmetric(vertical: 13),
          onPressed: onPressed,
          color: Colors.black87,
          textColor: Colors.white,
          child: Text(text), )) ;
  }
}
