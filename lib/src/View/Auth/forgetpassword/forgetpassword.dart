import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:star/src/Controller/Auth/forgetpassword_controller.dart';
import 'package:star/src/Utils/class/handlingdataview.dart';
import '../../../Utils/function/validinput.dart';
import '../../../Widgets/Auth/custombouttomauth.dart';
import '../../../Widgets/Auth/customtextbodyauth.dart';
import '../../../Widgets/Auth/customtextformauth.dart';
import '../../../Widgets/Auth/customtexttitleauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller = Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      body: GetBuilder<ForgetPasswordControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  SizedBox(height: 150),
                  const CustomTextTitleAuth(text: "Check Email"),
                  const SizedBox(height: 20),
                  CustomTextBodyAuth(
                    text: "Please Enter Digit Code Sent To Your Email",
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormAuth(
                    valid: (val) {
                      return validInput(val!, 5, 30, "email");
                    },
                    isNumber: false,
                    mycontroller: controller.email,
                    hinttext: "Enter Your Email",
                    labeltext: "Email",
                    iconData: Icons.email_outlined,
                  ),
                  const SizedBox(height: 20),
                  CustomBouttomAuth(
                    text: "Check",
                    onPressed: () {
                      controller.checkemail();
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
