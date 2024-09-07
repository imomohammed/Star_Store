import 'package:flutter/material.dart';
import '../../Utils/app_dimensions.dart';
import '../../Utils/function/colors.dart';

class CustomChoiceChip extends StatelessWidget {
  const CustomChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    // التحقق مما إذا كان النص يمثل لونًا
    final bool isColor = ColorsApp.getColor(text) != null;

    return ChoiceChip(
      label: isColor ? const SizedBox.shrink() : Text(text),
      selected: selected,
      onSelected: onSelected,
      labelStyle: TextStyle(
        color: selected ? Colors.white : null,
      ),
      labelPadding: isColor ? const EdgeInsets.all(0) : null,
      backgroundColor: isColor ? ColorsApp.getColor(text) ?? Colors.transparent : null,
      selectedColor: ColorsApp.getColor(text) ?? Colors.transparent,
      avatar: isColor
          ? Container(
        padding: const EdgeInsets.all(0),
        width: Dimensions.width10 * 5,
        height: Dimensions.width10 * 5, // تأكيد أن العرض والارتفاع متساويين
        decoration: BoxDecoration(
          color: ColorsApp.getColor(text) ?? Colors.transparent,
          shape: BoxShape.circle, // استخدام الشكل الدائري
        ),
      )
          : null,
    );

  }

}