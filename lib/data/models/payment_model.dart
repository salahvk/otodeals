class PaymentDetailsModel {
  bool? result;
  List<PaymentDetails>? paymentDetails;

  PaymentDetailsModel({this.result, this.paymentDetails});

  PaymentDetailsModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    if (json['payment_details'] != null) {
      paymentDetails = <PaymentDetails>[];
      json['payment_details'].forEach((v) {
        paymentDetails!.add(PaymentDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    if (paymentDetails != null) {
      data['payment_details'] = paymentDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PaymentDetails {
  String? item;
  String? value;
  String? displayName;

  PaymentDetails({this.item, this.value, this.displayName});

  PaymentDetails.fromJson(Map<String, dynamic> json) {
    item = json['item'];
    value = json['value'];
    displayName = json['display_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item'] = item;
    data['value'] = value;
    data['display_name'] = displayName;
    return data;
  }
}
