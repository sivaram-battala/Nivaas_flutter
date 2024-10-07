class LoginModel {
  String? primaryContact;
  String? otp;

  LoginModel({this.primaryContact, this.otp});

  LoginModel.fromJson(Map<String, dynamic> json) {
    primaryContact = json['primaryContact'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['primaryContact'] = this.primaryContact;
    data['otp'] = this.otp;
    return data;
  }
}