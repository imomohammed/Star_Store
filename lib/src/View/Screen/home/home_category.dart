import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:star/src/Utils/app_dimensions.dart';

import '../../../Model/categories_model.dart';
import '../sub_category/sub_category.dart';

class HomeCategory extends StatelessWidget {
  const HomeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
    height: Dimensions.height10*20, // ارتفاع أكبر لاحتواء العناصر بشكل أفضل
    child: ListView.builder(
    itemCount: 6,
    scrollDirection: Axis.horizontal,
    itemBuilder: (_, index) {
    return Padding(
    padding: const EdgeInsets.symmetric(horizontal:8 ),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center, // توسيط العناصر عمودياً
    children: [
    InkWell(
      onTap: ()=> Get.to(()=> SubCategoryScreen()),
      child: Container(
      width: Dimensions.width10*8, // زيادة العرض لتناسب الصورة
      height: Dimensions.height10*8, // زيادة الارتفاع لتناسب الصورة
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(40), // جعل الشكل دائرياً
      ),
      child: ClipOval(
      child: Image.asset(
      'assets/images/fash.png',
      fit: BoxFit.cover,
      ),
      ),
      ),
    ),
    // SizedBox(height: 8), // زيادة الفراغ العمودي بين الصورة والنص
    SizedBox(
    width: 80, // زيادة عرض الزر لتناسب النص
    child: TextButton(
      onPressed: () =>Get.to(()=> SubCategoryScreen()),
    child: Text(
    'shoes',
    style: TextStyle(
    color: Colors.black,
    fontSize: 14,
    ),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    textAlign: TextAlign.center, // محاذاة النص في الوسط
    ),
    style: ButtonStyle(
    alignment: Alignment.center, // توسيط محتويات الزر
    ),
    ),
    ),
    ],
    ),
    );
    },
    ),
    );
    }
    }


