import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:star/src/Utils/app_dimensions.dart';
import 'package:star/src/View/Screen/address/addres.dart';
import 'package:star/src/View/Screen/cart/cart.dart';
import 'package:star/src/View/Screen/orders/order.dart';
import 'package:star/src/View/Screen/setting/profilescreeen.dart';
import 'package:star/src/View/Screen/setting/widget/settingbody.dart';
import '../../../Controller/Auth/profilescreen_controller.dart';
import '../../../Utils/app_references.dart';
import '../../../Utils/routes.dart';

class Settings extends StatelessWidget {
  Settings({super.key});

  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black54,
          title: Text(
            "Account",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: Dimensions.height10 * 15,
                width: Dimensions.width20 * 40,
                decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.vertical(
                        top: Radius.zero,
                        bottom: Radius.circular(Dimensions.radius30 * 2))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(() {
                      final profile = profileController.userProfile.value;
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage('assets/images/user.png'),
                          radius: Dimensions.radius30 + 20,
                        ),
                        title: Text(
                          profile.userName ?? 'account user',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          profile.email ?? 'imo@gmail.com',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        trailing: IconButton(
                          onPressed: () => Get.to(() => ProfileScreen()),
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      );
                    }),
                    SizedBox(height: Dimensions.height10,)
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Account setting",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 20),
                    ),
                    SizedBox(height: Dimensions.height10,),
                    SettingBody(
                      icon: Icons.safety_check,
                      title: 'My Address',
                      subtitle: 'Set Shopping delivery address',
                      onTap: ()=> Get.to(Address()),
                    ),
                    SettingBody(
                      icon: Icons.shopping_cart,
                      title: 'My Cart',
                      subtitle: 'Add , remove products and move to checkout',
                      onTap: ()=> Get.to(Cart()),
                    ),
                    SettingBody(
                      icon: Icons.shopping_bag,
                      title: 'My Orders',
                      subtitle: 'In -progress and completed Orders',
                      onTap: ()=>Get.to(MyOrder()),
                    ),
                    SettingBody(
                      icon: Icons.safety_check,
                      title: 'My Address',
                      subtitle: 'Set Shopping delivery address',
                      onTap: (){},
                    ),
                    SettingBody(
                      icon: Icons.comment_bank,
                      title: 'Bank Account',
                      subtitle: 'Set Shopping delivery address',
                      onTap: () {},
                    ),
                    SettingBody(
                      icon: Icons.discount_outlined,
                      title: 'My Coupons',
                      subtitle: 'List of all the discounted coupons',
                      onTap: () {},
                    ),
                    SettingBody(
                      icon: Icons.notifications,
                      title: 'Notifications',
                      subtitle: 'Set any kind of notification message',
                      onTap: () {},
                    ),
                    SettingBody(
                      icon: Icons.security_outlined,
                      title: 'Account Privacy',
                      subtitle: 'Manage data usage and connected accounts',
                      onTap: () {},
                    ),
                    Divider(),
                    Padding(padding: EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("App Setting",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                          SizedBox(height: Dimensions.height10,),
                          SettingBody(
                            icon: Icons.upload,
                            title: 'Load Data',
                            subtitle: 'Upload Data to your Cloud Firebase',
                            onTap: () {},
                          ),
                          SettingBody(
                            icon: Icons.location_city,
                            title: 'Geolocation',
                            subtitle: 'Set recommendation based on location',
                            trailing: Switch(value: true,onChanged: (value){},),
                          ),
                          SettingBody(
                            icon: Icons.security,
                            title: 'Safe Mode',
                            subtitle: 'Search result is safe for all ages',
                            trailing: Switch(value: false,onChanged: (value){},),
                          ),
                          SettingBody(
                            icon: Icons.image,
                            title: 'HD Image Quality',
                            subtitle: 'Set image quality to be seen',
                            trailing: Switch(value: false,onChanged: (value){},),
                          ),
                          SizedBox(height: Dimensions.height20,),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: () async {
                                AppPreferences.clearPreferences();
                                Get.offAllNamed(AppRoute.login);
                              },
                              child: Text("Logout"),
                            ),
                          ),

                        ],
                      ),)
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
