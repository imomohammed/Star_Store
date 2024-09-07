import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:star/src/Utils/routes.dart';

import '../../Utils/class.dart';
import '../../Utils/function/handlingdatecontroller.dart';




abstract class VerifyCodeSignUpController extends GetxController{
  checkCode();
  goToSuccessSignUp(String verifyCodeSignUp);
}
// class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
//
  // VerfiyCodeSignUpData verfiyCodeSignUpData = VerfiyCodeSignUpData(Get.find());
//
//   String? email;
//
//   StatusRequest statusRequest = StatusRequest.none;
//
//   late String verifycode;
//
//   @override
//   checkCode() {
//   }
//
//   @override
//   goToSuccessSignUp(verifyCodeSignUp){}
// // async {
// //   statusRequest = StatusRequest.loading;
// //   update();
// //   var response = await verfiyCodeSignUpData.postdata(email!, verifyCodeSignUp);
// //   statusRequest = handlingData(response);
// //   if (StatusRequest.success == statusRequest) {
// //     if (response['status'] == "success") {
// //       Get.offNamed(AppRoute.successSignUp);
// //     } else {
// //       Get.defaultDialog(
// //           title: "ُWarning",
// //           middleText: "Verify Code Not Correct");
// //       statusRequest = StatusRequest.failure;
// //     }
// //   }
// //   update();
// // }
// //
// @override
// void onInit() {
//   email = Get.arguments['email'];
//   super.onInit();
//   // }
//
// }
// }
class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  String? email;
  StatusRequest statusRequest = StatusRequest.none;
  late String verifycode;

  @override
  void onInit() {
    super.onInit();

    // تحقق من وجود البيانات في Get.arguments
    if (Get.arguments != null && Get.arguments.containsKey('email')) {
      email = Get.arguments['email'];
    } else {
      // التعامل مع حالة عدم وجود البيانات
      email = null; // أو يمكنك عرض رسالة خطأ للمستخدم
    }
  }

  @override
  void checkCode() {
    // تنفيذ كود التحقق من الشيفرة
  }

  @override
  goToSuccessSignUp(String verifyCodeSignUp) {
    // TODO: implement goToSuccessSignUp
    throw UnimplementedError();
  }
}

//   @override
//   void goToSuccessSignUp(String verifyCodeSignUp) async {
//     // statusRequest = StatusRequest.loading;
//     // update();
//     // var response = await verfiyCodeSignUpData.postdata(email!, verifyCodeSignUp);
//     // statusRequest = handlingData(response);
//     // if (StatusRequest.success == statusRequest) {
//     //   if (response['status'] == "success") {
//     //     Get.offNamed(AppRoute.successSignUp);
//     //   } else {
//     //     Get.defaultDialog(
//     //         title: "Warning",
//     //         middleText: "Verify Code Not Correct");
//     //     statusRequest = StatusRequest.failure;
//       }
//     }
//     update();
//   }
// }
