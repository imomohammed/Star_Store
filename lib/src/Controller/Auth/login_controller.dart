import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/login_model.dart';
import '../../Utils/class.dart';
import '../../Utils/routes.dart';

class LoginControllerImp extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  var statusRequest = StatusRequest.none;
  bool isPasswordVisible = false;

  @override
  void onInit() {
    super.onInit();
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  void goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  void goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  Future<void> login(BuildContext context) async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      String userEmail = email.text.trim();
      String userPassword = password.text.trim();
      String fcmToken = ''; // Get the token here

      bool res = await loginUser(userEmail, userPassword, context, fcmToken);

      if (res) {
        statusRequest = StatusRequest.success;

        // Save the token
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', 'YOUR ACTUAL TOKEN HERE');

        Get.offAllNamed(AppRoute.home);
      } else {
        statusRequest = StatusRequest.failure;
        Get.snackbar("Error", "Login failed, please check your credentials");
      }
      update();
    }
  }
}
