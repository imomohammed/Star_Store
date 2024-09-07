
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'const.dart';

class AppPreferences extends GetxService{
  static SharedPreferences? _prefs;


  late SharedPreferences sharedPreferences;

  // Initialize SharedPreferences
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    G_user_id_val =_prefs?.getString(G_user_id) ?? '';
  }

   /// srting key
  static const String token = "token";
  static const String fcm_token = "fcm_token";
  static const String userId = "id";
  static const String userName = "user_name";
  static const String email = "email";
  static const String firstName = "first_name";
  static const String lastName = "last_name";
  static const String address = "address";
  static const String phone = "phone_number";
  static const String registrationDate = "registration_date";
  static const String _firstTimeKey = 'firstTime';

  static String? getString(String key) {
    return _prefs?.getString(key);
  }

  static Future<void> setString(String key, String value) async {
    await _prefs?.setString(key, value);
  }


  static bool getOnboarding() {
    return _prefs?.getBool('onboarding_complete') ?? false;
  }

  static Future<void> setOnboarding(bool value) async {
    await _prefs?.setBool('onboarding_complete', value);
  }
  static String? getToken() {
    return getString(token);
  }

  static Future<void> setToken(String value) async {
    await setString(token, value);
  }

  static String? getFCMToken() {
    return getString(fcm_token);
  }

  static Future<void> setFCMToken(String value) async {
    await setString(fcm_token, value);
  }
  static String? getUserId() {
    return getString(userId);
  }

  static Future<void> setUserId(String value) async {
    await setString(userId, value);
  }

  static String? getUserName() {
    return getString(userName);
  }

  static Future<void> setUserName(String value) async {
    await setString(userName, value);
  }
  static String? getEmail() {
    return getString(email);
  }

  static Future<void> setEmail(String value) async {
    await setString(email, value);
  }
  static String? getFirstName() {
    return getString(firstName);
  }

  static Future<void> setFirstName(String value) async {
    await setString(firstName, value);
  }
  static String? getLastName() {
    return getString(lastName);
  }

  static Future<void> setLastName(String value) async {
    await setString(lastName, value);
  }
  static String? getAddress() {
    return getString(address);
  }

  static Future<void> setAddress(String value) async {
    await setString(address, value);
  }
  static String? getPhoneNumber() {
    return getString(phone);
  }

  static Future<void> setPhoneNumber(String value) async {
    await setString(phone, value);
  }
  static String? getRegistrationDate() {
    return getString(registrationDate);
  }

  static Future<void> setRegistrationDate(String value) async {
    await setString(registrationDate, value);
  }

  static Future<bool> isFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirstTime = prefs.getBool(_firstTimeKey);
    return isFirstTime == null || isFirstTime;
  }

  static Future<void> setFirstTime(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_firstTimeKey, value);
  }

  static Future<void> clearPreferences() async {
    await _prefs?.clear();
  }

}


initialServices() async {
  await Get.putAsync(() => AppPreferences.init());
}
// final preferences = Preferences();


