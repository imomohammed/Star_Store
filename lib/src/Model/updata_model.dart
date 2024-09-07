
// api_service.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:star/src/Utils/const.dart';

class ApiService {

  // جلب بيانات المستخدم
  static Future<UserModel> getUserProfile() async {
    final response = await http.get(Uri.parse(path_api+ path_updata));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return UserModel.fromJson(data);
    } else {
      throw Exception('فشل في جلب بيانات المستخدم');
    }
  }

  // تحديث بيانات المستخدم
  static Future<void> updateUserProfile(UserModel user) async {
    final response = await http.put(
      Uri.parse(path_api+ path_updata),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('فشل في تحديث بيانات المستخدم');
    }
  }
}


// user_model.dart
class UserModel {
  String? userName;
  String? email;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;

  UserModel({
    this.userName,
    this.email,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.address,
  });

  // تحويل البيانات من JSON إلى نموذج مستخدم
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json['userName'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
    );
  }

  // تحويل نموذج المستخدم إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'address': address,
    };
  }

  // دالة copyWith لتحديث الحقول
  UserModel copyWith({
    String? userName,
    String? email,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? address,
  }) {
    return UserModel(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
    );
  }
}
