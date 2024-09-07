import 'package:flutter/material.dart';

import '../../Widgets/language/custombuttomlang.dart';

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Choose Language", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
           const SizedBox(height: 20,),
            CustomButtonLang( textbutton: "AR",onPressed: (){},),
            CustomButtonLang( textbutton: "EN",onPressed: (){},)

          ],
        ),
      ),
    );
  }
}
