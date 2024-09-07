import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:star/src/Utils/app_dimensions.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget{
  const TAppBar({super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed});


  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;


  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: Dimensions.height10),
    child: AppBar(
      automaticallyImplyLeading: false,
      leading: showBackArrow ? IconButton(onPressed: ()=> Get.back(), icon: Icon(Icons.arrow_left)) :
          leadingIcon != null ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon)) : null,
      title: title,
      actions: actions,
    ),);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
