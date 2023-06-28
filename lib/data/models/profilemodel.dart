class Profilemodel {
  bool? result;
  String? message;
  UserDetails? userDetails;

  Profilemodel({this.result, this.message, this.userDetails});

  Profilemodel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    userDetails = json['userDetails'] != null
        ? UserDetails.fromJson(json['userDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['message'] = message;
    if (userDetails != null) {
      data['userDetails'] = userDetails!.toJson();
    }
    return data;
  }
}

class UserDetails {
  int? id;
  String? name;
  String? email;
  // String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  //  profilePic;
  String? isApproved;
  // void profileimage;

  UserDetails(
      {this.id,
      this.name,
      this.email,
      // this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      // this.profilePic,
      this.isApproved,
      // this.profileimage});
      });

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    // emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    // profilePic = json['profile_pic'];
    isApproved = json['is_approved'];
    // profileimage = json['profileimage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    // data['email_verified_at'] = emailVerifiedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    // data['profile_pic'] = profilePic;
    data['is_approved'] = isApproved;
    // data['profileimage'] = profileimage;
    return data;
  }
}
