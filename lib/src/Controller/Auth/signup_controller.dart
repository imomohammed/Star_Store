import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Model/signup_model.dart';
import '../../Utils/class.dart';
import '../../Utils/routes.dart';
abstract class SignUpController extends GetxController{
  signup();
  goToSignIn();
}

class SignUpControllerImp extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  var statusRequest = StatusRequest.none;
  bool isPasswordVisible = false;

  @override
  signup() {
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    super.onInit();
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  void goToLogin() {
    Get.offNamed(AppRoute.login);
  }

  Future<void> signUp(BuildContext context) async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      String userUserName = userName.text.trim();
      String userPassword = password.text.trim();
      String userEmail = email.text.trim();
      String userFirstName = firstName.text.trim();
      String userLastName = lastName.text.trim();
      String userAddress = address.text.trim();
      String userPhoneNumber = phoneNumber.text.trim();
      String fcmToken = ''; // Get the token here

      bool res = await signUser(
          userUserName,
          userPassword,
          userEmail,
          userFirstName,
          userLastName,
          userAddress,
          userPhoneNumber,
          context,
          fcmToken);

      if (res) {
        statusRequest = StatusRequest.success;

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', 'YOUR ACTUAL TOKEN HERE');

        Get.offAllNamed(AppRoute.home);
      } else {
        statusRequest = StatusRequest.failure;
        Get.snackbar("Error", "Sign up failed, please check your input");
      }
      update();
    }
  }
}


// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../Model/signup_model.dart';
// import '../../Utils/class.dart';
// import '../../Utils/routes.dart';
//
// abstract class SignUpController extends GetxController{
//   signup();
//   goToSignIn();
// }
//
// class SignUpControllerImp extends GetxController {
//   GlobalKey<FormState> formstate = GlobalKey<FormState>();
//   TextEditingController userName = TextEditingController();
//   TextEditingController password = TextEditingController();
//   TextEditingController email = TextEditingController();
//   TextEditingController firstName = TextEditingController();
//   TextEditingController lastName = TextEditingController();
//   TextEditingController address = TextEditingController();
//   TextEditingController phoneNumber = TextEditingController();
//
//   var statusRequest = StatusRequest.none;
//   bool isPasswordVisible = false;
//
//   @override
//   signup(){
//   }
//
//   @override
//   goToSignIn() {
//     Get.offNamed(AppRoute.login);
//
//   }
//
//   @override
//   void onInit() {
//     super.onInit();
//   }
//
//   void togglePasswordVisibility() {
//     isPasswordVisible = !isPasswordVisible;
//     update();
//   }
//
//   void goToLogin() {
//     Get.offNamed(AppRoute.login);
//   }
//
//   Future<void> signUp(BuildContext context) async {
//     if (formstate.currentState!.validate()) {
//       statusRequest = StatusRequest.loading;
//       update();
//
//       String userUserName = userName.text.trim();
//       String userPassword = password.text.trim();
//       String userEmail = email.text.trim();
//       String userFirstName = firstName.text.trim();
//       String userLastName = lastName.text.trim();
//       String userAddress = address.text.trim();
//       String userPhoneNumber = phoneNumber.text.trim();
//       String fcmToken = ''; // Get the token here
//
//       bool res = await signUser(
//           userUserName, userPassword, userEmail, userFirstName, userLastName, userAddress, userPhoneNumber, context, fcmToken);
//
//       if (res) {
//         statusRequest = StatusRequest.success;
//
//         // Save the token
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         await prefs.setString('token', 'YOUR ACTUAL TOKEN HERE');
//
//         Get.offAllNamed(AppRoute.home);
//       } else {
//         statusRequest = StatusRequest.failure;
//         Get.snackbar("Error", "Sign up failed, please check your input");
//       }
//       update();
//     }
//   }
// }
//
// // import 'package:flutter/cupertino.dart';
// // import 'package:get/get.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:star/src/Utils/routes.dart';
// // import '../../Utils/class.dart';
// //
// //
// //
// //
// // abstract class SignUpController extends GetxController{
// //   signup();
// //   goToSignIn();
// // }
// // class SignUpControllerImp extends SignUpController {
// //
// //   GlobalKey<FormState> formstate = GlobalKey<FormState>();
// //
// //   late TextEditingController username;
// //   late TextEditingController email;
// //   late TextEditingController password;
// //   late TextEditingController firstname;
// //   late TextEditingController lastname;
// //   late TextEditingController address;
// //   late TextEditingController phonenumber;
// //
// //    final Future<SharedPreferences> prefs =  SharedPreferences.getInstance();
// //
// //    Future<void> registerWithEmail() async{
// //    }
// //   StatusRequest statusRequest = StatusRequest.none;
// //
// //   List data = [];
// //
// //   @override
// //   signup(){
// //   }
// //
// //
// //
// //   @override
// //   goToSignIn() {
// //     Get.offNamed(AppRoute.login);
// //
// //   }
// //
// //   @override
// //   void onInit() {
// //     username =TextEditingController();
// //    email =TextEditingController();
// //    password =TextEditingController();
// //     firstname =TextEditingController();
// //     lastname =TextEditingController();
// //     address =TextEditingController();
// //     phonenumber =TextEditingController();
// //     super.onInit();
// //   }
// //
// //   @override
// //   void dispose() {
// //     username.dispose();
// //     email.dispose();
// //     password.dispose();
// //     firstname.dispose();
// //     lastname.dispose();
// //     address.dispose();
// //     phonenumber.dispose();
// //
// //     super.dispose();
// //   }
// //
// //
// //
// // }