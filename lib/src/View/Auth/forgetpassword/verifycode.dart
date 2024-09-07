import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:star/src/Controller/Auth/forgetpassword_controller.dart';
import '../../../Controller/Auth/verifycode_controller.dart';
import '../../../Widgets/Auth/custombouttomauth.dart';
import '../../../Widgets/Auth/customtextbodyauth.dart';
import '../../../Widgets/Auth/customtexttitleauth.dart';



class VerifyCode extends StatelessWidget {
  const VerifyCode({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller =Get.put(VerifyCodeControllerImp());
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.purple,
      //   elevation: 0.0,
      //   centerTitle: true,
      //   title: const Text("Verification Code", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
      // ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 30),
        child: ListView(
            children: [
              SizedBox(height: 100,),
              const CustomTextTitleAuth(text: "Check Code"),
              const SizedBox(height: 20,),
               CustomTextBodyAuth(text:"Please Enter Your Email Address To Recive A verifiction code",),
              const SizedBox(height: 20,),
              OtpTextField(
    fieldWidth: 50.0,
                borderRadius:   BorderRadius.circular(20),
                numberOfFields: 5,
                borderColor: Color(0xFF512DA8),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode){
      controller.goToResetPassword(verificationCode);
                      }
                  ),
              // end onSu
              // SizedBox(height: 20,),
            ]),
      ),
    );
  }
}
