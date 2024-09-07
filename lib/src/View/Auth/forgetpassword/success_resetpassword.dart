import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controller/Auth/successresetpassword_controller.dart';
import '../../../Widgets/Auth/custombouttomauth.dart';


class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller = Get.put(SuccessResetPasswordControllerImp());
    //SuccessResetPasswordControllerImp controller = Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.purple,
      //   elevation: 0.0,
      //   centerTitle: true,
      //   title: const Text("Success Sign Up", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
      // ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 100,),
            Center(child: Icon(Icons.check_circle_outlined,size: 200,color: Colors.purple,)),
            Text("Congralulations", style: TextStyle(color: Colors.purple,fontSize: 20,fontWeight: FontWeight.bold),),
            Spacer(),
            Container(
              width: double.infinity,
              child: CustomBouttomAuth(text: "Go To Login", onPressed: (){
                 controller.goToPageLogin();
              }),
            ),
            SizedBox(height: 200),

          ],
        ),
      ),

    );
  }
}
