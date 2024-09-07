import 'package:flutter/material.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer({
    super.key,
    this.width ,
    this.height ,
    this.radius = 16,
    this.padding,
    this.child,
    this.backgroundColor = Colors.transparent,
    this.margin,
    this.showBorder =false,
    this.borderColor = Colors.grey,
  });

  final double? width;
  final double? height;
  final double radius;
  final bool showBorder;
  final Color borderColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  final Color backgroundColor;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
        border: showBorder ? Border.all(color: borderColor) : null
      ),
      child: child,

    );
  }
}
