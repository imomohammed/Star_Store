import 'package:flutter/material.dart';
import 'package:star/src/Utils/app_dimensions.dart';

class CustomCardHome extends StatelessWidget {
  final String title;
  final String body;
  const CustomCardHome({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(vertical: Dimensions.width15),
      child: Stack(children: [
        Container(
          alignment: Alignment.center,
          height: 150,
          decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(20)),
          child: ListTile(
            title: Text(title,
                style: const TextStyle(color: Colors.white, fontSize: 20)),
            subtitle: Text(body,
                style: const TextStyle(color: Colors.white, fontSize: 30)),
          ),
        ),
        Positioned(
          top: -20,
          right: -20,
          child: Container(
            height: Dimensions.height10*16,
            width: Dimensions.width20*8,
            decoration: BoxDecoration(
                color:Colors.purple[200],
                borderRadius: BorderRadius.circular(Dimensions.radius20*8)),
          ),
        )
      ]),
    );
  }
}