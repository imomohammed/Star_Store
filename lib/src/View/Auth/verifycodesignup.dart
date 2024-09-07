import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:star/src/Controller/Auth/forgetpassword_controller.dart';
import 'package:star/src/Utils/app_dimensions.dart';
import 'package:star/src/Utils/images.dart';
import 'package:star/src/View/Auth/login.dart';
import '../../Controller/Auth/verifycodesignup_controller.dart';
import '../../Utils/class/handlingdataview.dart';
import '../../Utils/function/validinput.dart';
import '../../Widgets/Auth/custombouttomauth.dart';
import '../../Widgets/Auth/customtextbodyauth.dart';
import '../../Widgets/Auth/customtextformauth.dart';
import '../../Widgets/Auth/customtexttitleauth.dart';



class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
  Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
     appBar: AppBar(
       automaticallyImplyLeading: false,
       actions: [IconButton(onPressed: ()=> Get.offAll(()=> LoginView()), icon: Icon(CupertinoIcons.clear))],
     ),
      body: GetBuilder<VerifyCodeSignUpControllerImp>(
        builder:(controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
          padding:  EdgeInsets.symmetric(vertical: Dimensions.width15
              ,horizontal: Dimensions.height30),
            child: ListView(
                children: [
                  SizedBox(height: Dimensions.height20*5,),
                  const CustomTextTitleAuth(text: "Check Code"),
                   SizedBox(height: Dimensions.height20),
                  CustomTextBodyAuth(text:"Please Enter Your Email Address To Recive A verifiction code",),
                   SizedBox(height: Dimensions.height20,),
                  OtpTextField(
                      fieldWidth: 50.0,
                      borderRadius:   BorderRadius.circular(Dimensions.radius20),
                      numberOfFields: 5,
                      borderColor: Color(0xFF512DA8),
                      //set to true to show as box or false to show as dash
                      showFieldAsBox: true,
                      //runs when a code is typed in
                      onCodeChanged: (String code) {
                        //handle validation or checks here
                      },
                      //runs when every textfield is filled
                      onSubmit: (String verificationCode) {
                        controller.goToSuccessSignUp(verificationCode);
                      }
                  ),
                  // end onSu
                  // SizedBox(height: 20,),
                ]),
          ),
        ),
      ),
    );
  }
}
