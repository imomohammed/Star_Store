import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:star/src/Utils/routes.dart';

import '../../Utils/class.dart';
import '../../Utils/function/handlingdatecontroller.dart';




abstract class ResetPasswordController extends GetxController{
  resetpassword();
  goToSuccessResetPassword();
}
class ResetPasswordControllerImp extends ResetPasswordController {

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  //ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());

  StatusRequest statusRequest = StatusRequest.none ;

  late TextEditingController password ;
  late TextEditingController repassword;

  String? email;

  @override
  resetpassword() {
  }

  @override
  goToSuccessResetPassword() {}
  // async {
  //   if (password.text != repassword.text) {
  //     return Get.defaultDialog(
  //         title: "warning", middleText: "Password Not Match");
  //   }
  //
  //   if (formstate.currentState!.validate()) {
  //     statusRequest = StatusRequest.loading;
  //     update();
  //     var response = await resetPasswordData.postdata(email!, password.text);
  //     print("=============================== Controller $response ");
  //     statusRequest = handlingData(response);
  //     if (StatusRequest.success == statusRequest) {
  //       if (response['status'] == "success") {
  //         // data.addAll(response['data']);
  //         Get.offNamed(AppRoute.successResetPassword);
  //       } else {
  //         Get.defaultDialog(
  //             title: "ُWarning", middleText: "Try Again");
  //         statusRequest = StatusRequest.failure;
  //       }
  //     }
  //     update();
  //   } else {
  //     print("Not Valid");
  //   }
  // }
  @override
  void onInit() {
    password =TextEditingController();
    repassword =TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }

}