import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:star/src/Utils/class.dart';
import 'package:star/src/Utils/routes.dart';
import '../../Utils/function/handlingdatecontroller.dart';

abstract class ForgetPasswordController extends GetxController {
  checkemail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  //CheckEmailData checkEmailData  = CheckEmailData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;

  late TextEditingController email;

  @override
  checkemail() {
    // تنفيذ عملية التحقق من البريد الإلكتروني
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
