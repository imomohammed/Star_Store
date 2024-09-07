import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controller/Auth/resetpassword_controller.dart';
import '../../../Utils/class/handlingdataview.dart';
import '../../../Utils/function/validinput.dart';
import '../../../Widgets/Auth/custombouttomauth.dart';
import '../../../Widgets/Auth/customtextbodyauth.dart';
import '../../../Widgets/Auth/customtextformauth.dart';
import '../../../Widgets/Auth/customtexttitleauth.dart';



class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller =Get.put(ResetPasswordControllerImp());
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.purple,
      //   elevation: 0.0,
      //   centerTitle: true,
      //   title: const Text("Reset Password", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
      // ),
      body: GetBuilder<ResetPasswordControllerImp>(
        builder: (controller) => HandlingDataRequest(
      statusRequest: controller.statusRequest,
      widget: Container(
          padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 30),
          child: Form(
            key: controller.formstate,
            child: ListView(
                children: [
                  SizedBox(height: 100,),
                  const CustomTextTitleAuth(text: "New Password"),
                  const SizedBox(height: 10,),
                   CustomTextBodyAuth(text:"Please Enter New Password",),
                  const SizedBox(height: 20,),
                  // SizedBox(height: 20,),
                  CustomTextFormAuth(
                    isNumber: false,
                    valid: (val){
                      return validInput(val!, 6, 30, "password");
                    },
                    mycontroller: controller.password,
                    hinttext: "Enter Your Password",
                    labeltext: "Password",
                    iconData: Icons.lock_clock_outlined,
                  ),
                  CustomTextFormAuth(
                    valid: (val){
                      return validInput(val!, 5, 30, "repassword");
                    },
                    mycontroller: controller.repassword,
                    hinttext: " Re Enter Your Password",
                    labeltext: "Re Password",
                    iconData: Icons.lock_clock_outlined, isNumber: false,
                  ),



                  CustomBouttomAuth(text: "Save", onPressed: (){
                    controller.goToSuccessResetPassword();
                  }),
                  const SizedBox(height: 30,),
                ]),
          ),
        ),
      ),
      ),
    );
  }
}
