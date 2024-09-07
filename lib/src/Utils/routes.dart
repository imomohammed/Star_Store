
import 'package:get/get.dart';
import 'package:star/src/View/Auth/login.dart';
import 'package:star/src/View/Auth/signup.dart';
import 'package:star/src/View/Auth/forgetpassword/verifycode.dart';
import 'package:star/src/View/Onboraing/on_boraing.dart';

import '../View/Auth/forgetpassword/forgetpassword.dart';
import '../View/Auth/forgetpassword/resetpassword.dart';
import '../View/Auth/forgetpassword/success_resetpassword.dart';
import '../View/Auth/success_signup.dart';
import '../View/Auth/verifycodesignup.dart';
import '../View/Screen/home/home.dart';
import '../View/Screen/product/produsctdetails.dart';
import '../View/Splash/splash.dart';

class AppRoute{
  static const String splash="/splash";
  static const String onBorading="/onborading";
  static const String login="/login";
  static const String signUp="/signup";
  static const String home = "/home";
  static const String forgetPassword="/forgetpassword";
  static const String verifyCode="/verifycode";
  static const String resetPassword="/resetpassword";
  static const String successSignUp = "/successsignup";
  static const String successResetPassword="/successresetpassword";
  static const String verifyCodeSignUp="/verifycodesignUp";
  static const String produsctdetail="/produsctdetail";


  static  String getsplash()=> '$splash';
  static  String getonborading()=> '$onBorading';
  static  String getlogin()=> '$login';
  static  String getsignUph()=> '$signUp';
  static  String getforgetpassword()=> '$forgetPassword';
  static  String getverifycode()=> '$verifyCode';
  static  String getresetpassword()=> '$resetPassword';
  static  String getsuccesssignup()=> '$successSignUp';
  static  String getfsuccessresetpassword()=> '$successResetPassword';
  static  String getverifycodesignUp()=> '$verifyCodeSignUp';
  static  String getprodusctdetail()=> '$produsctdetail';
  // static  String gethome()=> '$home';


  static List<GetPage> routes = [
    GetPage(name: splash, page: () => Splash()),
    GetPage(name: onBorading, page: () => OnboardingView()),
    GetPage(name: login, page: () => LoginView()),
    GetPage(name: signUp, page: () => SingUp()),
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: forgetPassword, page: () => ForgetPassword()),
    GetPage(name: verifyCode, page: () => VerifyCode()),
    GetPage(name: resetPassword, page: () => ResetPassword()),
    GetPage(name: successSignUp, page: () => SuccessSignUp()),
    GetPage(name: successResetPassword, page: () => SuccessResetPassword()),
    GetPage(name: verifyCodeSignUp, page: () => VerifyCodeSignUp()),
   // GetPage(name: produsctdetail, page: () => ProdusctDetail()),
  ];




}
