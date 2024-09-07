import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:star/src/Utils/app_dimensions.dart';
import 'package:star/src/View/Screen/address/widget/singleaddress.dart';

import 'add_new_address.dart';

class Address extends StatefulWidget {
  const Address({super.key});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Address ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.purple),),
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()=> Get.to(()=> AddNewAddress()),
      child: Icon(Icons.add,color: Colors.white,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              SingleAddress(selectedAddress: false,),
              SizedBox(height: Dimensions.height20,),
              SingleAddress(selectedAddress: true,)

            ],
          ),
        ),
      ),
    );
  }
}
