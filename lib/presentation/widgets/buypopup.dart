import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/controllers.dart';
import 'package:otodeals/core/routes_manager.dart';
import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/data/repositories/buynow.dart';
import 'package:otodeals/presentation/widgets/buyerdetail_field.dart';

class PopupWindow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(16),
      child: Container(
        height:MediaQuery.of(context).size.height/1.3,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
           
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Buyer Details',
                style:  getBoldStyle(
                              color: const Color.fromARGB(255, 37, 37, 37),
                              fontSize: 16),
              ),
              SizedBox(
                          height: 20,
                        ),
                        BuyerDetailField(
                            controller: ProductController.nameController,
                            hintText: "Enter Name"),
                            
                        BuyerDetailField(
                            controller: ProductController.phoneNoController,
                            hintText: "Enter Phone"),
                        BuyerDetailField(
                            controller: ProductController.mailController,
                            hintText: "Enter Email"),
                        BuyerDetailField(
                            controller: ProductController.addressController,
                            hintText: "Enter Address"),
                        BuyerDetailField(
                            controller: ProductController.cityController,
                            hintText: "Enter City"),
                        BuyerDetailField(
                            controller: ProductController.locationController,
                            hintText: "Enter Location"),
                        SizedBox(
                          height: 28,
                        ),
                InkWell(
                          onTap: () async {
                            final token = Hive.box('token').get('api_token');
                            if (token == null) {
                              Navigator.pushNamedAndRemoveUntil(context,
                                  Routes.loginScreen, (route) => false);
                            } else {
                              final isRequested = await buyNow(context);
                              isRequested
                                  ? Navigator.pop(context)
                                  : null;
                              // if (ProductConstroller
                              //     .bidController.text.isEmpty) {
                              //   showAnimatedSnackBar(
                              //       context, "Enter a bid amount");
                              // } else {}
                            }
                          },
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width / 1.5,
                            decoration: BoxDecoration(
                                color: Colormanager.primary,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                              "Submit",
                              style: getSemiBoldStyle(
                                  color: Colormanager.white, fontSize: 15),
                            )),
                          ),
                        )
            ],
          ),
        ),
      ),
    );
  }
}
