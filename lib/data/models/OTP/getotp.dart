// To parse this JSON data, do
//
//     final getOtp = getOtpFromJson(jsonString);


class GetOtp {
    bool result;
    String message;
    int otp;

    GetOtp({
        required this.result,
        required this.message,
        required this.otp,
    });

    factory GetOtp.fromJson(Map<String, dynamic> json) => GetOtp(
        result: json["result"],
        message: json["message"],
        otp: json["otp"],
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
        "otp": otp,
    };
}
