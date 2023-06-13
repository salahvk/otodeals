import 'package:otodeals/data/commonviewmodel/customerdetlCviewmodel.dart';

class RegCommonViewModel {
  final bool? result;
  final String? message;
  final customerCommonViewModel? customerDetails;

  RegCommonViewModel({
    this.result,
    this.message,
    this.customerDetails,
  });

  factory RegCommonViewModel.fromJson(Map<String, dynamic> json) {
    return RegCommonViewModel(
      result: json['result'],
      message: json['message'],
      customerDetails: json['customerdetails'] != null
          ? customerCommonViewModel.fromJson(json['customerdetails'])
          : null,
    );
  }
}






