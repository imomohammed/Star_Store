class TestModel {
  String? usersId;
  String? usersName;
  String? usersPassword;
  String? usersEmail;
  String? usersFirstName;
  String? usersLastName;
  String? usersAddress;
  String? usersRegistrationDate;
  String? usersPhoneNumber;
  String? usersVerifycode;

  TestModel(
      {this.usersId,
        this.usersName,
        this.usersPassword,
        this.usersEmail,
        this.usersFirstName,
        this.usersLastName,
        this.usersAddress,
        this.usersPhoneNumber,
        this.usersRegistrationDate,
        this.usersVerifycode,});

  TestModel.fromJson(Map<String, dynamic> json) {
    usersId = json['id'];
    usersName = json['user_name'];
    usersPassword = json['password'];
    usersEmail = json['email'];
    usersFirstName = json['first_name'];
    usersLastName = json['last_name'];
    usersAddress = json['address'];
    usersPhoneNumber = json['phone_number'];
    usersRegistrationDate = json['registration_date'];
    usersVerifycode = json['verify_code'];

  }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['users_id'] = this.usersId;
//   data['users_name'] = this.usersName;
//   data['users_password'] = this.usersPassword;
//   data['users_email'] = this.usersEmail;
//   data['users_phone'] = this.usersPhone;
//   data['users_verfiycode'] = this.usersVerfiycode;
//   data['users_approve'] = this.usersApprove;
//   data['users_create'] = this.usersCreate;
//   return data;
// }
}