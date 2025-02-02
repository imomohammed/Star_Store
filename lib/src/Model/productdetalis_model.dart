import 'package:flutter/material.dart';
import 'package:star/src/Utils/app_dimensions.dart';

class RoundedImage extends StatelessWidget{
const RoundedImage({
  super.key,
  this.border,
  this.padding,
  this.onPressed,
  this.width,
  this.height,
  this.applyImageRadius =true,
  required this.imageUrl,
  this.fit =BoxFit.contain,
  this.backgroundColor,
  this.isNetworkImage =false,
  this.broderRadius = 20,
});
  final double? width,height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double broderRadius;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,color: backgroundColor,borderRadius: BorderRadius.circular(broderRadius)
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius ? BorderRadius.circular(broderRadius):BorderRadius.zero,
          child: Image(fit: fit,image: isNetworkImage ? NetworkImage(imageUrl) : AssetImage(imageUrl) as ImageProvider,),

        ),
      ),
    );
  }
  
  
}