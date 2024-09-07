import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:star/src/Utils/app_references.dart';
import '../Model/onboarding_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class OnboardingController extends GetxController {
  var currentPage = 0.obs;// متغير لمراقبة الصفحة الحالية
  late PageController pageController;

  final List<OnboardingModel> onboardingPages = [
    OnboardingModel(
      image: 'assets/images/1_on bording.png',
      title: 'Welcome to App',
      description: 'This is a simple onboarding screen.',
    ),
    OnboardingModel(
      image: 'assets/images/2_on bording.png',
      title: 'Explore Features',
      description: 'Explore the amazing features of our app.',
    ),
    OnboardingModel(
      image: 'assets/images/3_on bording.png',
      title: 'Get Started',
      description: 'Let\'s get started using the app!',
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  void nextPage() {
    if (currentPage.value < onboardingPages.length - 1) {
      pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
    } else {
      completeOnboarding();
    }
  }

  void skipOnboarding() {
    completeOnboarding();
  }

  void completeOnboarding() async {
    AppPreferences.setOnboarding(true);
    Get.offNamed('/login');  // الانتقال الى الصفحة الرئيسية دون الرجوع الى الصفحات الاولى
  }
}
