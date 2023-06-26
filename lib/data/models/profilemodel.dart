class Profilemodel {
  bool? result;
  String? message;
  UserDetails? userDetails;

  Profilemodel({this.result, this.message, this.userDetails});

  Profilemodel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    userDetails = json['userDetails'] != null
        ? new UserDetails.fromJson(json['userDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['message'] = this.message;
    if (this.userDetails != null) {
      data['userDetails'] = this.userDetails!.toJson();
    }
    return data;
  }
}

class UserDetails {
  int? id;
  String? name;
  String? email;
  Null emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  Null profilePic;
  String? isApproved;
  Null profileimage;

  UserDetails(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.profilePic,
      this.isApproved,
      this.profileimage});

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profilePic = json['profile_pic'];
    isApproved = json['is_approved'];
    profileimage = json['profileimage'];
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
    data['profileimage'] = this.profileimage;
    return data;
  }
}
