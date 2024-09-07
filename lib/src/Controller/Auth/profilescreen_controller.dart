// profilescreen_controller.dart
import 'package:get/get.dart';
import '../../Model/updata_model.dart';


class ProfileController extends GetxController {
  var userProfile = UserModel().obs;

  @override
  void onInit() {
    fetchUserProfile();
    super.onInit();
  }

  // جلب بيانات المستخدم
  void fetchUserProfile() async {
    try {
      userProfile.value = await ApiService.getUserProfile();
    } catch (e) {
      // تعامل مع الأخطاء هنا
      print('Error: $e');
    }
  }

  // تحديث بيانات المستخدم
  void updateProfile(String field, String newValue) async {
    try {
      var updatedProfile = userProfile.value;
      switch (field) {
        case 'email':
          updatedProfile.email = newValue;
          break;
        case 'first_name':
          updatedProfile.firstName = newValue;
          break;
        case 'last_name':
          updatedProfile.lastName = newValue;
          break;
        case 'phone_number':
          updatedProfile.phoneNumber = newValue;
          break;
        case 'address':
          updatedProfile.address = newValue;
          break;
      // أضف الحقول الأخرى حسب الحاجة
      }
      await ApiService.updateUserProfile(updatedProfile);
      userProfile.value = updatedProfile;  // تحديث البيانات المعروضة
    } catch (e) {
      // تعامل مع الأخطاء هنا
      print('Error: $e');
    }
  }
}
