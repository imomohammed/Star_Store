import 'package:flutter/material.dart';
class CustomButtonLang extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const CustomButtonLang({super.key, required this.textbutton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(
        color: Colors.purple,
        onPressed: (){},
        textColor: Colors.white,
        child: Text(textbutton,style: TextStyle(fontWeight: FontWeight.bold),),),);
  }
}
