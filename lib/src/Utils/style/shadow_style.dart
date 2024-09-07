
import 'package:flutter/material.dart';

class TShadowStyle{

  static final verticalProductShadow = BoxShadow(
    color: Colors.grey.withOpacity(0.1), // لون الظل مع شفافية
    blurRadius: 50, // تحديد مقدار التمويه
    offset: Offset(0, 2), // تحديد الإزاحة الأفقية والعمودية للظل
    spreadRadius: 7, // تحديد مدى انتشار الظل
  );

}