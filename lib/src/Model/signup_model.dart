import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Utils/app_references.dart';
import '../Utils/const.dart';

Future<bool> signUser(
    String userName,
    String password,
    String email,
    String firstName,
    String lastName,
    String address,
    String phoneNumber,
    BuildContext context,
    String fcmToken
    ) async {
  var url = Uri.parse(path_api + path_signup); // تأكد من أن رابط API صحيح

  // إعداد البيانات للإرسال
  var body = {
    'user_name': userName,
    'password': password,
    'email': email,
    'first_name': firstName,
    'last_name': lastName,
    'address': address,
    'phone_number': phoneNumber,
  };

  var headers = {'Content-Type': 'application/x-www-form-urlencoded'};

  try {
    // إرسال طلب POST
    http.Response response = await http.post(url, headers: headers, body: body);

    // طباعة الاستجابة للتحقق منها
    print('Response body: ${response.body}');
    print('Content-Type: ${response.headers['content-type']}');

    if (response.statusCode == 200) {
      // التحقق من نوع المحتوى قبل محاولة فك الترميز
      var contentType = response.headers['content-type'];
      if (contentType != null && contentType.contains('application/json')) {
        // فك ترميز JSON فقط إذا كانت الاستجابة JSON
        var decodedResponse = json.decode(response.body);

        print("Decoded Response: $decodedResponse");

        // التأكد من أن الرد هو Map (خريطة)
        if (decodedResponse is Map<String, dynamic>) {
          // التحقق من نجاح عملية التسجيل
          if (decodedResponse["result"] == "success") {
            // التعامل مع رسالة النص
            String message = decodedResponse["message"];
            var user = decodedResponse["user"] ?? {}; // بيانات المستخدم

            print('Signup successful: $message');

            // حفظ بيانات المستخدم في AppPreferences
            AppPreferences.setToken(""); // حسب الحاجة
            AppPreferences.setFCMToken(fcmToken ?? "");
            AppPreferences.setUserId(user["id"]?.toString() ?? "");
            AppPreferences.setUserName(user["user_name"] ?? "");
            AppPreferences.setEmail(user["email"] ?? "");
            AppPreferences.setFirstName(user["first_name"] ?? "");
            AppPreferences.setLastName(user["last_name"] ?? "");
            AppPreferences.setAddress(user["address"] ?? "");
            AppPreferences.setPhoneNumber(user["phone_number"]?.toString() ?? "");
            AppPreferences.setRegistrationDate(user["registration_date"]?.toString() ?? "");

            // التنقل إلى الشاشة الرئيسية
            // Navigator.pushReplacement(
            //     context, MaterialPageRoute(builder: (context) => HomeScreen()));

            return true;
          } else {
            print('Error: ${decodedResponse["message"]}');
            return false;
          }
        } else {
          print('Error: Response is not a valid JSON map');
          return false;
        }
      } else {
        print('Error: Response is not JSON');
        return false;
      }
    } else {
      print('Error: Failed with status code ${response.statusCode}');
      return false;
    }
  } catch (e) {
    print("Error: $e");
    return false;
  }
}


