import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/onboarding_controller.dart';


class OnboardingView extends StatelessWidget {
  final OnboardingController controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            controller: controller.pageController,
            itemCount: controller.onboardingPages.length,
            onPageChanged: (index) {
              controller.currentPage.value = index;
            },
            itemBuilder: (context, index) {
              final page = controller.onboardingPages[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(page.image, height: 300.0),
                  SizedBox(height: 20.0),
                  Text(page.title, style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(page.description, textAlign: TextAlign.center, style: TextStyle(fontSize: 16.0)),
                  ),
                ],
              );
            },
          ),
          Positioned(
            bottom: 20.0,
            left: 20.0,
            right: 20.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => controller.currentPage.value != controller.onboardingPages.length - 1
                    ? TextButton(
                  onPressed: controller.skipOnboarding,
                  child: Text("SKIP", style: TextStyle(color: Colors.purple)),
                )
                    : Container()),
                Row(
                  children: List.generate(
                    controller.onboardingPages.length,
                        (index) => Obx(() => _buildDot(index: index, currentIndex: controller.currentPage.value)),
                  ),
                ),
                Obx(() => controller.currentPage.value != controller.onboardingPages.length - 1
                    ? TextButton(
                  onPressed: controller.nextPage,
                  child: Text("NEXT", style: TextStyle(color: Colors.purple)),
                )
                    : TextButton(
                  onPressed: controller.completeOnboarding,
                  child: Text("DONE", style: TextStyle(color: Colors.purple)),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot({required int index, required int currentIndex}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: 10.0,
      width: currentIndex == index ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: currentIndex == index ? Colors.purple : Colors.grey,
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}
