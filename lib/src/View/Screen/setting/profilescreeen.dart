import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controller/Auth/profilescreen_controller.dart';
import '../../../Utils/app_dimensions.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: Obx(() {
        final profile = profileController.userProfile.value;

        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/user.png'),
                        radius: Dimensions.radius30 + 20,
                      ),
                      TextButton(
                        onPressed: () {
                          // Method to handle profile picture change
                          _changeProfilePicture();
                        },
                        child: Text("Change Profile Picture",
                            style: TextStyle(color: Colors.black, fontSize: 14)),
                      )
                    ],
                  ),
                ),
                SizedBox(height: Dimensions.height10),
                Divider(),
                SizedBox(height: Dimensions.height10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Profile Information",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
                SizedBox(height: Dimensions.height10),
                _buildProfileRow("Email", profile.email ?? '', 'email'),
                _buildProfileRow("Password", '********', 'password'),
                SizedBox(height: Dimensions.height10),
                Divider(),
                SizedBox(height: Dimensions.height10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Personal Information",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.height10),
                _buildProfileRow("First Name", profile.firstName ?? '', 'first_name'),
                _buildProfileRow("Last Name", profile.lastName ?? '', 'last_name'),
                _buildProfileRow("Phone Number", profile.phoneNumber ?? '', 'phone_number'),
                _buildProfileRow("Address", profile.address ?? '', 'address'),
                SizedBox(height: Dimensions.height10),
                Divider(),
                Center(
                  child: TextButton(
                    onPressed: () {
                      // Implement account closure
                      _closeAccount();
                    },
                    child: Text("Account Close",
                        style: TextStyle(color: Colors.red, fontSize: 16)),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildProfileRow(String title, String value, String field) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            title,
            style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            value,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          child: IconButton(
            onPressed: () {
              _showEditDialog(field, value);
            },
            icon: Icon(
              Icons.arrow_right_outlined,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  void _showEditDialog(String field, String currentValue) {
    final TextEditingController controller = TextEditingController(text: currentValue);

    Get.dialog(
      AlertDialog(
        title: Text("Edit $field"),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: "Enter new $field",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              final newValue = controller.text;
              profileController.updateProfile(field, newValue);
              Get.back();
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }

  void _changeProfilePicture() {
    // Implement method to change profile picture
  }

  void _closeAccount() {
    // Implement account closure logic
  }
}
