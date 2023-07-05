import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/controllers.dart';
import 'package:otodeals/core/routes_manager.dart';
import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/data/repositories/buynow.dart';
import 'package:otodeals/presentation/widgets/buyerdetail_field.dart';

class BuyNow extends StatefulWidget {
  const BuyNow({
    super.key,
  });

  @override
  State<BuyNow> createState() => _BuyNowState();
}

class _BuyNowState extends State<BuyNow> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      onExpansionChanged: (value) {
        setState(() {
          isVisible = value;
        });
      },
      trailing: SizedBox(
        height: 0,
      ),
      tilePadding: EdgeInsets.only(left: 30),
      title: Container(
        height: 50,
        // width: size.width * .5,
        decoration: BoxDecoration(
            color: Colormanager.primary,
            borderRadius: BorderRadius.circular(30)),
        child: Center(
            child: Text(
          "BUY NOW",
          style: getBoldStyle(color: Colormanager.white, fontSize: 15),
        )),
      ),
      children: [
        !isVisible
            ? Container()
            : Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                child: Container(
                  // height: 230,
                  width: MediaQuery.of(context).size.width / 1.3,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 239, 239, 239),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 6,
                          color: Color.fromARGB(255, 174, 174, 174),
                          blurStyle: BlurStyle.normal)
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25.0, bottom: 15),
                    child: Column(
                      children: [
                        Text(
                          "Buyer Details",
                          style: getBoldStyle(
                              color: const Color.fromARGB(255, 37, 37, 37),
                              fontSize: 14),
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
                                  ? setState(() {
                                      isVisible = false;
                                    })
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
              ),
      ],
    );
  }
}
