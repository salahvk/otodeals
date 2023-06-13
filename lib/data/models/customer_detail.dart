class Customerdetails {
  int? id;
  String? name;
  String? email;
  Null emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  Null profilePic;
  String? isApproved;
  int? userId;
  String? deviceId;
  String? apiToken;
  String? apiTokenExpiry;

  Customerdetails(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.profilePic,
      this.isApproved,
      this.userId,
      this.deviceId,
      this.apiToken,
      this.apiTokenExpiry});

  Customerdetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profilePic = json['profile_pic'];
    isApproved = json['is_approved'];
    userId = json['user_id'];
    deviceId = json['device_id'];
    apiToken = json['api_token'];
    apiTokenExpiry = json['api_token_expiry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['profile_pic'] = this.profilePic;
    data['is_approved'] = this.isApproved;
    data['user_id'] = this.userId;
    data['device_id'] = this.deviceId;
    data['api_token'] = this.apiToken;
    data['api_token_expiry'] = this.apiTokenExpiry;
    return data;
  }
}
