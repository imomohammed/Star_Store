import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:star/src/View/Screen/home/home.dart';
import '../Utils/app_references.dart';
import '../Utils/const.dart';
import 'dart:convert';

Future<bool> loginUser(
    String email, String password, BuildContext context, String fcmToken) async {
  var url = Uri.parse(path_api +path_login);

  // Encode the body as form data
  var body = {
    'email': email,
    'password': password,
  };

  // Set the headers for form-urlencoded content
  var headers = {'Content-Type': 'application/x-www-form-urlencoded'};

  try {
    // Send the POST request
    http.Response response =
    await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      // Decode the response body
      var decodedResponse = json.decode(response.body);

      // Check the result of the login attempt
      if (decodedResponse["result"] == "success") {
        // Extract user data from the message
        List<dynamic> userList = decodedResponse["message"];

        if (userList.isNotEmpty) {
          Map<String, dynamic> user = userList[0];

          // Save user data in AppPreferences
          AppPreferences.setToken(user["token"] ?? "");
          AppPreferences.setFCMToken(fcmToken ?? "");
          AppPreferences.setUserId(user["id"].toString());
          AppPreferences.setUserName(user["user_name"] ?? "");
          AppPreferences.setEmail(user["email"] ?? "");
          AppPreferences.setFirstName(user["first_name"] ?? "");
          AppPreferences.setLastName(user["last_name"] ?? "");
          AppPreferences.setAddress(user["address"] ?? "");
          AppPreferences.setPhoneNumber(user["phone_number"].toString());
          AppPreferences.setRegistrationDate(user["registration_date"].toString());

          // Navigate to HomeScreen
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
          print('Login successful');
          return true;
        } else {
          print('Error: No user data found');
          return false;
        }
      } else {
        print('Error: ${decodedResponse["message"]}');
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

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:star/src/View/Screen/home/home.dart';
// import '../Utils/app_references.dart';
// import '../Utils/const.dart';
// import '../Utils/linkapi.dart';
// import 'dart:convert';
//
// Future<bool> loginUser(
//     String email, String password, BuildContext context, String fcmToken) async {
//   var url = Uri.parse(path_api + path_login);
//
//   // Encode the body as form data
//   var body = {
//     'email': email,
//     'password': password,
//   };
//
//   // Set the headers for form-urlencoded content
//   var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
//
//   try {
//     // Send the POST request
//     http.Response response =
//     await http.post(url, headers: headers, body: body);
//
//     if (response.statusCode == 200) {
//       print(body);
//       print(headers);
//       print(json.decode(response.body)["message"]);
//
//       // Since the API is returning a list of users, handle it as a list
//       List<dynamic> userList = json.decode(response.body)["message"];
//
//       // Assuming you want the first user from the list
//       if (userList.isNotEmpty) {
//         Map<String, dynamic> user = userList[0];
//
//         AppPreferences.setToken(user["token"] ?? "");
//         AppPreferences.setFCMToken(fcmToken ?? "");
//         AppPreferences.setUserId(user["id"].toString());
//         AppPreferences.setUserName(user["user_name"] ?? "");
//         AppPreferences.setEmail(user["email"] ?? "");
//         AppPreferences.setFirstName(user["first_name"] ?? "");
//         AppPreferences.setLastName(user["last_name"] ?? "");
//         AppPreferences.setAddress(user["address"] ?? "");
//         AppPreferences.setPhoneNumber(user["phone_number"].toString());
//         AppPreferences.setRegistrationDate(user["registration_date"].toString());
//
//         Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (context) => HomeScreen()));
//         print('success');
//         return true;
//       } else {
//         print('error: no user data found');
//         return false;
//       }
//     } else {
//       print('error');
//       return false;
//     }
//   } catch (e) {
//     print("Error: $e");
//     return false;
//   }
// }
