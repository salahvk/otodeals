import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/routes_manager.dart';
import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/data/api/api_endpoint.dart';
import 'package:otodeals/data/providers/bidprovider.dart';
import 'package:otodeals/data/repositories/vehicledetails.dart';
import 'package:otodeals/presentation/screens/productdetails.dart';

import 'package:otodeals/presentation/widgets/Timers/bidtimer.dart';
import 'package:otodeals/presentation/widgets/bottom_nav.dart';
import 'package:provider/provider.dart';

class MyBidList extends StatefulWidget {
  const MyBidList({super.key});

  @override
  State<MyBidList> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<MyBidList> {
  List<bool> isSelected = [true, false];
  @override
  void initState() {
    //  WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   await getbidhistorydetails(context);
    //  });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    final bidres = Provider.of<Bidprovider>(context, listen: false);
    
    void inputbidhistory(index) async {
      final res = Provider.of<Bidprovider>(context, listen:true);
      int? id = res.bidvar?.bidHistory![index].id;
      res.id=id;
      print(res.bidvar?.bidHistory![index].id);
      await getvehicledetails(context, id!);
      Navigator.of(context).push(FadePageRoute(page: Porductdetails()));
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colormanager.primary,
                      borderRadius: BorderRadius.circular(25)),
                  width: size.width,
                  height: 90,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "MY BID LIST",
                              style: getSemiBoldStyle(
                                  color: Colormanager.white, fontSize: 15),
                            ),
                            Image.asset("assets/menu.png")
                          ],
                        ),
                        // Container(
                        //     width: size.width,
                        //     height: 35,
                        //     decoration: BoxDecoration(
                        //         color: Colormanager.white,
                        //         borderRadius: BorderRadius.circular(8)),
                        //     // child:
                        //     // TextField(
                        //     //   decoration: InputDecoration(
                        //     //       border: InputBorder.none,
                        //     //       hintText: 'Search',
                        //     //       hintStyle: getSemiBoldStyle(
                        //     //           color: Colormanager.textColor,
                        //     //           fontSize: 15),
                        //     //       prefixIcon: const Icon(
                        //     //         Icons.search,
                        //     //         color: Colormanager.textColor,
                        //     //       ),
                        //     //       suffixIcon: const Icon(
                        //     //         Icons.location_on_sharp,
                        //     //         color: Colormanager.primary,
                        //     //       )),
                        //     // ))
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: bidres.bidvar?.bidHistory?.length.toString(),
                        style: getSemiBoldStyle(
                            color: Colormanager.primary, fontSize: 16),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' RESULTS',
                            style: getSemiBoldStyle(
                                color: Colormanager.textColor, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colormanager.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(2, 2.5),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 10,
                        color: Colormanager.primary,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Bid status:",
                      style: getMediumtStyle(color: Colormanager.textColor),
                    ),
                    Text(
                      "Success",
                      style: getMediumtStyle(color: Colormanager.green),
                    )
                  ],
                ),
              ),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: bidres.bidvar?.bidHistory?.length ?? 0,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: () {
                     inputbidhistory(index);
                        },
                        child: Container(
                          // height: size.height / 3.6,
                          width: size.width / 1.17,
                          decoration: BoxDecoration(
                              color: Colormanager.background,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 194, 193, 193)
                                          .withOpacity(0.5), // Shadow color
                                  spreadRadius:
                                      5, // Spread radius of the shadow
                                  blurRadius: 6, // Blur radius of the shadow
                                  offset: Offset(0, 3), // Offset of the shadow
                                ),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        bidres.bidvar?.bidHistory![index]
                                                .vehicleName ??
                                            "",
                                        style: getMediumtStyle(
                                            color: Colors.black, fontSize: 18)),
                                    //  Container(
                                    //                   width: 40,
                                    //                   height: 15,
                                    //                   decoration: BoxDecoration(
                                    //                       color: Colormanager.primary,
                                    //                       borderRadius:
                                    //                           BorderRadius.circular(15)),
                                    //                   child: Center(
                                    //                     child: Text(
                                    //                       "Bid Now",
                                    //                       style: getRegularStyle(
                                    //                           color: Colormanager.white,
                                    //                           fontSize: 7),
                                    //                     ),
                                    //                   ),
                                    //                 )
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: SizedBox(
                                    height: 130,
                                    width: size.width * .8,
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "$endpoint${bidres.bidvar?.bidHistory![index].image}",
                                      fit: BoxFit.cover,
                                      errorWidget: (context, url, error) {
                                        return Container(
                                          color: Colors.grey,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 80,
                                      decoration: BoxDecoration(
                                          color: Colormanager.buttonBox,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Center(
                                            child: Text(
                                          "Model: ${bidres.bidvar?.bidHistory![index].modelyear.toString()}",
                                          style: getMediumtStyle(
                                              color: Colormanager.buttonText,
                                              fontSize: 10),
                                        )),
                                      ),
                                    ),
                                    Container(
                                      width: 80,
                                      decoration: BoxDecoration(
                                          color: Colormanager.buttonBox,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Center(
                                            child: Text(
                                          bidres.bidvar?.bidHistory![index]
                                                  .fueltype ??
                                              "",
                                          style: getMediumtStyle(
                                              color: Colormanager.buttonText,
                                              fontSize: 10),
                                        )),
                                      ),
                                    ),
                                    Container(
                                      width: 80,
                                      decoration: BoxDecoration(
                                          color: Colormanager.buttonBox,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Center(
                                            child: Text(
                                          "Mileage: ${bidres.bidvar?.bidHistory![index].mileage.toString()}",
                                          style: getMediumtStyle(
                                              color: Colormanager.buttonText,
                                              fontSize: 10),
                                        )),
                                      ),
                                    ),
                                    Container(
                                      width: 80,
                                      decoration: BoxDecoration(
                                          color: Colormanager.buttonBox,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Center(
                                            child: Text(
                                          "Owner: ${bidres.bidvar?.bidHistory![index].owner.toString()}",
                                          style: getMediumtStyle(
                                              color: Colormanager.buttonText,
                                              fontSize: 10),
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Minimum Bid Amount",
                                          style: getSemiBoldStyle(
                                              color: Colormanager.black,
                                              fontSize: 10),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                            "RS. ${bidres.bidvar?.bidHistory![index].minimumbitamount.toString()}",
                                            style: getBoldStyle(
                                                color: Colors.black,
                                                fontSize: 15))
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Starts In",
                                          style: getSemiBoldStyle(
                                              color: Colormanager.primary,
                                              fontSize: 10),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        BidtimerScreen(
                                          index: index,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(isInsidePage: true),
    );
  }
}
