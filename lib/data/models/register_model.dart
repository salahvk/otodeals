import 'package:otodeals/data/models/customer_detail.dart';

class Regmodel {
  bool? result;
  String? message;
  CustomerDDetails? customerdetails;

  Regmodel({this.result, this.message, this.customerdetails});

  Regmodel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    customerdetails = json['customerdetails'] != null
        ? CustomerDDetails.fromJson(json['customerdetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['message'] = message;
    if (customerdetails != null) {
      data['customerdetails'] = customerdetails!.toJson();
    }
    return data;
  }
}


