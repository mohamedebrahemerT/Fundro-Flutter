class SignUpBodyModel {
  String? phone;
  String? email;
  String? password;
  String? passwordConfirmation;
  String? refCode;
  String? deviceToken;
  int? id;
  String? name;

  SignUpBodyModel({
    this.phone,
    this.email = '',
    this.password,
    this.passwordConfirmation,
    this.refCode = '',
    this.deviceToken,
    this.id,
    this.name,
  });

  SignUpBodyModel.fromJson(Map<String, dynamic> json) {
    phone = json['phone_number'];
    email = json['email'];
    password = json['password'];
    password = json['password_confirmation'];
    refCode = json['ref_code'];
    deviceToken = json['cm_firebase_token'];
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone_number'] = phone;
    data['email'] = email;
    data['password'] = password;
    data['password_confirmation'] = password;
    // data['ref_code'] = refCode;
    // data['role'] = "Customer";
    // data['cm_firebase_token'] = deviceToken;
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
