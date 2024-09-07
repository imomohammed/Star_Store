import 'package:flutter/material.dart';
import 'package:star/src/Utils/app_dimensions.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new Address"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_2_rounded),
                    labelText: 'Name',
                  ),
                ),
                SizedBox(height: Dimensions.height20 - 4),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    labelText: 'Phone Number',
                  ),
                ),
                SizedBox(height: Dimensions.height20 - 4),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.location_city),
                          labelText: 'City',
                        ),
                      ),
                    ),
                    SizedBox(width: Dimensions.width10),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.streetview),
                          labelText: 'Street',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.height20 - 4), // تعديل هنا للفصل بين الصفوف
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.location_city),
                          labelText: 'City',
                        ),
                      ),
                    ),
                    SizedBox(width: Dimensions.width10),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.streetview),
                          labelText: 'Street',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.height10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.location_city),
                          labelText: 'Country',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.height20),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Save'),
            ),
        ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
