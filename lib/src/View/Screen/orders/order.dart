import 'package:flutter/material.dart';
import 'package:star/src/View/Screen/orders/widget/TOrderListItem.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.purple),),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: TOrderListItem(),
      ),
    );
  }
}
