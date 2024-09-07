import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:star/src/Utils/component/progress.dart';
import 'package:star/src/Utils/function/validinput.dart';
import 'package:star/src/View/Screen/home/home.dart';
import '../../Controller/Auth/login_controller.dart';
import '../../Controller/Auth/login_controller.dart';
import '../../Model/login_model.dart';
import '../../Utils/app_dimensions.dart';
import '../../Utils/class/handlingdataview.dart';
import '../../Utils/function/alertexitapp.dart';
import '../../Widgets/Auth/appbarcustomclipper.dart';
import '../../Widgets/Auth/custombouttomauth.dart';
import '../../Widgets/Auth/customtextformauth.dart';


class LoginView extends StatefulWidget {

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isloading = false;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

//   void login(context) async {
//     if (email.text.isNotEmpty && password.text.isNotEmpty) {
//       setState(() {
//         isloading = true;
//       });
//       bool res = await loginUser(email.text, password.text, context);
//       setState(() {
//         isloading = res;
//       });
//     }
//
// }

  @override
  Widget build(BuildContext context) {
    // التأكد من أن التحكم في الحالة موجود
    Get.put(LoginControllerImp());


    return Scaffold(
      appBar: AppBar(
       // backgroundColor: Colors.purple,
        title: Text("Welcome Back",style: TextStyle(color: Colors.white),) ,
        toolbarHeight: 110,
        elevation: 0.0,
        centerTitle: true,
        flexibleSpace: ClipPath(
          //clipper: AppbarCustomClipper(),
          child: Container(
            height: Dimensions.height10 * 45,
            width: Dimensions.width20 * 100,
            decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.vertical(
                    top: Radius.zero,
                    bottom: Radius.circular(Dimensions.radius30 * 2))),
            // child: Center(
            //   //child:   Image.asset('assets/images/logo.png', height: 180.0,color: Colors.white,),
            // ),
          ),
        ),
        //title: const Text("Sing in", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LoginControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Form(
                key: formstate,
                child: ListView(children: [
                  // const LogoAuth(),
                 // const CustomTextTitleAuth(text: "Welcome Back"),
                  const SizedBox(height: 60),
                  // const CustomTextBodyAuth(
                  //   text:
                  //   "Sign In with your email and password or continue with social media",
                  // ),
                  const SizedBox(height: 20),
                  CustomTextFormAuth(
                    valid: (val) {
                      return validInput(val!, 5, 30, "email");
                    },
                    mycontroller: email,
                    hinttext: "Enter Your Email",
                    labeltext: "Email",
                    iconData: Icons.email_outlined,
                    isNumber: false,
                  ),
                  const SizedBox(height: 20),
                  GetBuilder<LoginControllerImp>(
                    builder: (controller) {
                      if (controller == null) {
                        return Text('Error: Controller is null'); // تحقق من أن controller ليس null
                      }
                      return CustomTextFormAuth(
                        obsureText: controller.isPasswordVisible,
                        onTapIcon: () {
                          controller.togglePasswordVisibility();
                        },
                        valid: (val) {
                          return validInput(val ?? '', 5, 30, "password"); // تجنب null هنا
                        },
                        mycontroller: password,
                        hinttext: "Enter Your Password",
                        labeltext: "Password",
                        iconData: controller.isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        isNumber: false,
                      );
                    },
                  ),

                  InkWell(
                    onTap: () {
                      controller.goToForgetPassword();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(value: true, onChanged: (value){}),
                            Text("Remmber me",style: TextStyle(color: Colors.black87,fontSize: 16),)
                          ],
                        ),
                        Text(
                          "Forget Password",
                          style: TextStyle(color: Colors.redAccent, fontSize: 14),
                        ),
                        /// Remmber me

                      ],
                    ),
                  ),
                  SizedBox(height: Dimensions.height10,),
                  CustomBouttomAuth(
                    text: "Sign In",
                    onPressed: () async {
                      if (email.text.isNotEmpty && password.text.isNotEmpty) {
                        setState(() {
                          isloading = true;
                        });

                        bool res = await loginUser(email.text, password.text, context, '');

                        setState(() {
                          isloading = false;
                        });

                        if (res) {
                          Get.to(() => HomeScreen());
                        } else {
                          Get.snackbar("Error", "Login failed, please check your credentials",snackStyle: SnackStyle.FLOATING, backgroundColor: Colors.white,colorText: Colors.red,icon: Icon(Icons.nearby_error,color: Colors.amber,));
                        }
                      } else {
                        Get.snackbar("Error", "Please enter both email and password" ,snackStyle: SnackStyle.FLOATING, backgroundColor: Colors.white,colorText: Colors.red,icon: Icon(Icons.nearby_error, color: Colors.amber,));
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,child: OutlinedButton(onPressed: (){ controller.goToSignUp();},child: Text('Creat Account',style: TextStyle(color: Colors.black87,fontSize: 18),),),
                  )
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
