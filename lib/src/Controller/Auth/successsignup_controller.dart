import 'package:get/get.dart';
import 'package:star/src/Utils/routes.dart';

abstract class SuccessSignUpController extends GetxController{



  goToPageLogin();
}

class SuccessSignUpControllerImp extends SuccessSignUpController{
  @override
  goToPageLogin() {
    Get.offAllNamed(AppRoute.login);

  }

}