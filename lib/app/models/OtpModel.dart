class OtpModel {
  String? token;
  String? refreshToken;
  String? type;
  int? id;
  List<String>? roles;
  String? primaryContact;

  OtpModel(
      {this.token,
      this.refreshToken,
      this.type,
      this.id,
      this.roles,
      this.primaryContact});

  OtpModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    refreshToken = json['refreshToken'];
    type = json['type'];
    id = json['id'];
    roles = json['roles'].cast<String>();
    primaryContact = json['primaryContact'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['refreshToken'] = this.refreshToken;
    data['type'] = this.type;
    data['id'] = this.id;
    data['roles'] = this.roles;
    data['primaryContact'] = this.primaryContact;
    return data;
  }
}
