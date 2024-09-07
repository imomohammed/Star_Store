import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:star/src/Utils/app_references.dart';
import 'package:star/src/Utils/images.dart';
import 'dart:async';
import 'package:star/src/Utils/routes.dart';


class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _checkLoginStatus();
  }

  void _checkLoginStatus() async {
    String? token = AppPreferences.getToken();

    Timer(Duration(seconds: 3), () {
      print(token);
      if (token != null && token.isNotEmpty) {
        // المستخدم مسجل الدخول، الانتقال إلى الصفحة الرئيسية
       Get.offAllNamed(AppRoute.home);
        //Get.offAll(() => HomeScreen());
      } else {
        // المستخدم غير مسجل الدخول، الانتقال إلى صفحة تسجيل الدخول
        Get.offAllNamed(AppRoute.login);
        //Get.offAll(() => LoginView());
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(TImages.logo, height: 180.0, color: Colors.white),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
