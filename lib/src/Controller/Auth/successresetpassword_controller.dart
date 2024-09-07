import 'package:get/get.dart';
import 'package:star/src/Utils/routes.dart';

abstract class SuccessResetPasswordController extends GetxController{



  goToPageLogin();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController{
  @override
  goToPageLogin() {
    Get.offAllNamed(AppRoute.login);

  }

}