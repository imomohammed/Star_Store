import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool>alertExitApp(){

   Get.defaultDialog(
    title: "Warning",
    middleText: "Do you want to exit the application?",
    actions: [
      ElevatedButton(onPressed: (){
        exit(0);
      }, child: Text("Yes")),
      ElevatedButton(onPressed: (){
        Get.back();
      }, child: Text("cancel")),
    ],
  );
  return Future.value(true);
}