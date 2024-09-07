

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


import '../View/Screen/home/home.dart';

abstract class HomeScreenController extends GetxController {
  static HomeScreenController get instance => Get.find();

  final carousalCurrentIndex =0.obs;

  void updatePageIndicator(index){
    carousalCurrentIndex.value =index;
  }
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const HomeScreen(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text("Settings"))],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text("Profile"))],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text("Favorite"))],
    )
  ];

  List  titlebottomappbar = [
  "home" ,
  "settings" ,
  "cart" ,
  "favorite"
  ] ;

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}