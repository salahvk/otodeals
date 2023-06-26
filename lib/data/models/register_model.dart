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
        ? new CustomerDDetails.fromJson(json['customerdetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['message'] = this.message;
    if (this.customerdetails != null) {
      data['customerdetails'] = this.customerdetails!.toJson();
    }
    return data;
  }
}


