import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:star/src/Utils/app_dimensions.dart';
import 'package:star/src/Utils/function/validinput.dart';
import 'package:star/src/View/Auth/login.dart';
import '../../Controller/Auth/signup_controller.dart';
import '../../Utils/class/handlingdataview.dart';
import '../../Utils/function/alertexitapp.dart';


class SingUp extends StatelessWidget {
  const SingUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_left_rounded),
          onPressed: () => Get.to(()=>LoginView())
        ),
        //backgroundColor: Colors.purple,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<SignUpControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Form(
                key: controller.formstate,
                child: Column(
                  children: [
                    SizedBox(height: Dimensions.height10),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: controller.firstName,
                            validator: (val) {
                              return validInput(val!, 3, 10, "firstname");
                            },
                            decoration: InputDecoration(
                              labelText: 'First name',
                              prefixIcon: Icon(Icons.person_2_outlined),
                              border: OutlineInputBorder(), // إضافة إطار حول الحقل
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black54, width: 2.0),
                                borderRadius: BorderRadius.circular(Dimensions.radius15), // لون الإطار عندما يكون الحقل مركّزاً
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 1.0), // لون الإطار عندما يكون الحقل غير مركّز
                              ),
                              // يمكنك إضافة المزيد من الخصائص هنا مثل `errorBorder`, `disabledBorder`, إلخ
                            ),
                          ),
                        ),
                        SizedBox(width: Dimensions.width10),
                        Expanded(
                          child: TextFormField(
                            controller: controller.lastName,
                            validator: (val) {
                              return validInput(val!, 3, 10, "lastname");
                            },
                            decoration: InputDecoration(
                              labelText: 'Last name',
                              prefixIcon: Icon(Icons.person_2_outlined),
                              border: OutlineInputBorder(), // إضافة إطار حول الحقل
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black54, width: 2.0),
                                borderRadius: BorderRadius.circular(Dimensions.radius20), // لون الإطار عندما يكون الحقل مركّزاً
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 1.0), // لون الإطار عندما يكون الحقل غير مركّز
                              ),
                              // يمكنك إضافة المزيد من الخصائص هنا مثل `errorBorder`, `disabledBorder`, إلخ
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Dimensions.height15),
                    TextFormField(
                      controller: controller.userName,
                      validator: (val) {
                        return validInput(val!, 3, 10, "username");
                      },
                      decoration: InputDecoration(
                        labelText: 'User Name',
                        prefixIcon: Icon(Icons.person_2_outlined),
                        border: OutlineInputBorder(), // إضافة إطار حول الحقل
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54, width: 2.0),
                          borderRadius: BorderRadius.circular(Dimensions.radius20), // لون الإطار عندما يكون الحقل مركّزاً
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1.0), // لون الإطار عندما يكون الحقل غير مركّز
                        ),
                        // يمكنك إضافة المزيد من الخصائص هنا مثل `errorBorder`, `disabledBorder`, إلخ
                      ),
                    ),
                    SizedBox(height: Dimensions.height15),
                    TextFormField(
                      controller: controller.email,
                      validator: (val) {
                        return validInput(val!, 10, 25, "email");
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(), // إضافة إطار حول الحقل
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54, width: 2.0),
                          borderRadius: BorderRadius.circular(Dimensions.radius20), // لون الإطار عندما يكون الحقل مركّزاً
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1.0), // لون الإطار عندما يكون الحقل غير مركّز
                        ),
                        // يمكنك إضافة المزيد من الخصائص هنا مثل `errorBorder`, `disabledBorder`, إلخ
                      ),
                    ),
                    SizedBox(height: Dimensions.height15),
                    TextFormField(
                      controller: controller.phoneNumber,
                      validator: (val) {
                        return validInput(val!, 9, 12, "phonenumber");
                      },
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(), // إضافة إطار حول الحقل
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54, width: 2.0),
                          borderRadius: BorderRadius.circular(Dimensions.radius20), // لون الإطار عندما يكون الحقل مركّزاً
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1.0), // لون الإطار عندما يكون الحقل غير مركّز
                        ),
                        // يمكنك إضافة المزيد من الخصائص هنا مثل `errorBorder`, `disabledBorder`, إلخ
                      ),
                    ),
                    SizedBox(height: Dimensions.height15),
                    TextFormField(
                      controller: controller.address,
                      validator: (val) {
                        return validInput(val!, 3, 10, "address");
                      },
                      decoration: InputDecoration(
                        labelText: 'Address',
                        prefixIcon: Icon(Icons.location_on),
                        border: OutlineInputBorder(), // إضافة إطار حول الحقل
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54, width: 2.0),
                          borderRadius: BorderRadius.circular(Dimensions.radius20), // لون الإطار عندما يكون الحقل مركّزاً
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1.0), // لون الإطار عندما يكون الحقل غير مركّز
                        ),
                        // يمكنك إضافة المزيد من الخصائص هنا مثل `errorBorder`, `disabledBorder`, إلخ
                      ),
                    ),
                    SizedBox(height: Dimensions.height15),
                    TextFormField(
                      controller: controller.password,
                      validator: (val) {
                        return validInput(val!, 5, 10, "password");
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(), // إضافة إطار حول الحقل
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54, width: 2.0),
                          borderRadius: BorderRadius.circular(Dimensions.radius20), // لون الإطار عندما يكون الحقل مركّزاً
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1.0), // لون الإطار عندما يكون الحقل غير مركّز
                        ),
                        // يمكنك إضافة المزيد من الخصائص هنا مثل `errorBorder`, `disabledBorder`, إلخ
                      ),
                    ),
                    SizedBox(height: Dimensions.height20),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          controller.signUp(context); // قم بإضافة هذه السطر لاستدعاء دالة التسجيل
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.grey, width: 2.0),
                          backgroundColor: Colors.black87,
                        ),
                        child: Text(
                          'Create Account',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
