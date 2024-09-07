import 'package:flutter/material.dart';


class CustomTextFormAuth extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?) valid;
  final bool? obsureText ;
  final void Function()? onTapIcon;

    const CustomTextFormAuth({super.key, required this.hinttext, required this.labeltext, required this.iconData,  this.mycontroller, required this.valid,this.obsureText,this.onTapIcon, required bool isNumber});

    @override
    Widget build(BuildContext context) {
      return   Container(
        margin: EdgeInsets.only(bottom: 15),
        child: TextFormField(
          validator: valid,
          controller: mycontroller,
          obscureText: obsureText == null ||  obsureText == false ? false: true,
          decoration: InputDecoration(
            hintText: hinttext,
            helperStyle: const TextStyle(fontSize: 6,),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 30),
            label: Container(
                margin: const EdgeInsets.symmetric(vertical:9),
                child: Text(labeltext,style: TextStyle(color: Colors.black87,fontSize: 18),)),
            suffixIcon: InkWell(child: Icon(iconData ,color: Colors.black87,),onTap: onTapIcon,),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
            ),
          ),
        ),
      );
    }
  }
