import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/controllers.dart';
import 'package:otodeals/core/routes_manager.dart';
import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/data/repositories/placebid.dart';

class BidListTile extends StatefulWidget {
  const BidListTile({
    super.key,
  });

  @override
  State<BidListTile> createState() => _BidListTileState();
}

class _BidListTileState extends State<BidListTile> {
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
          "PLACE YOUR BID",
          style: getBoldStyle(color: Colormanager.white, fontSize: 15),
        )),
      ),
      children: [
        !isVisible
            ? Container()
            : Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                child: Container(
                  height: 230,
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
                    padding: const EdgeInsets.only(
                      top: 25.0,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "ENTER YOUR BID AMOUNT:",
                          style: getBoldStyle(
                              color: const Color.fromARGB(255, 37, 37, 37),
                              fontSize: 14),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Bid amount must be greater than 1 lack",
                          style: getMediumtStyle(
                              color: Colormanager.greyText, fontSize: 12),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 23.0, right: 23),
                          child: TextField(
                            controller: ProductController.bidController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colormanager.background,
                              hintStyle: getSemiBoldStyle(
                                  fontSize: 14,
                                  color: const Color.fromARGB(255, 14, 14, 14)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2,
                                      color:
                                          Color.fromARGB(255, 202, 200, 200))),
                            ),
                          ),
                        ),
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
                              final isRequested = await placeBid(context);
                              isRequested
                                  ? setState(() {
                                      isVisible = false;
                                    })
                                  : null;
                              // if (ProductController
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
                              "PLACE YOUR BID",
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
