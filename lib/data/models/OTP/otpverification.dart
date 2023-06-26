// To parse this JSON data, do
//
//     final otp = otpFromJson(jsonString);




class OtpVerification{
    bool result;
    String message;
    Customerdetails? customerdetails;

    OtpVerification({
        required this.result,
        required this.message,
        required this.customerdetails,
    });

    factory OtpVerification.fromJson(Map<String, dynamic> json) => OtpVerification(
        result: json["result"],
        message: json["message"],
        customerdetails: json['customerdetails']!= null?
        Customerdetails.fromJson(json["customerdetails"])
        :null
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
        "customerdetails": customerdetails?.toJson(),
    };
}

class Customerdetails {
    int id;
    //String name;
    String email;
   // dynamic emailVerifiedAt;
   // DateTime createdAt;
   // DateTime updatedAt;
   // dynamic profilePic;
    //String isApproved;
    int userId;
    String?deviceId;
    String? apiToken;
    DateTime apiTokenExpiry;

    Customerdetails({
        required this.id,
       // required this.name,
        required this.email,
        //this.emailVerifiedAt,
        //required this.createdAt,
        //required this.updatedAt,
       // this.profilePic,
       // required this.isApproved,
        required this.userId,
        required this.deviceId,
        required this.apiToken,
        required this.apiTokenExpiry,
    });

    factory Customerdetails.fromJson(Map<String, dynamic> json) => Customerdetails(
        id: json["id"],
       // name: json["name"],
        email: json["email"],
       // emailVerifiedAt: json["email_verified_at"],
       // createdAt: DateTime.parse(json["created_at"]),
       // updatedAt: DateTime.parse(json["updated_at"]),
        //profilePic: json["profile_pic"],
        //isApproved: json["is_approved"],
        userId: json["user_id"],
        deviceId: json["device_id"],
        apiToken: json["api_token"],
        apiTokenExpiry: DateTime.parse(json["api_token_expiry"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        //"name": name,
        "email": email,
        //"email_verified_at": emailVerifiedAt,
        //"created_at": createdAt.toIso8601String(),
        //"updated_at": updatedAt.toIso8601String(),
        //"profile_pic": profilePic,
        //"is_approved": isApproved,
        "user_id": userId,
        "device_id": deviceId,
        "api_token": apiToken,
        "api_token_expiry": apiTokenExpiry.toIso8601String(),
    };
}

