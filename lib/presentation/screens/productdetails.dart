import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/controllers.dart';
import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/data/api/api_endpoint.dart';
import 'package:otodeals/data/providers/vehicledetails.dart';
import 'package:otodeals/presentation/widgets/Timers/vehicledetailtimer.dart';
import 'package:otodeals/presentation/widgets/bidlisttile.dart';
import 'package:otodeals/presentation/widgets/bottom_nav.dart';
import 'package:otodeals/presentation/widgets/buynow_listtile.dart';
import 'package:otodeals/presentation/widgets/detail_card.dart';
import 'package:provider/provider.dart';

class Porductdetails extends StatefulWidget {
  const Porductdetails({super.key});

  @override
  State<Porductdetails> createState() => _PorductdetailsState();
}

class _PorductdetailsState extends State<Porductdetails> {
  bool showSecondContainer = false;
  bool isExpanded = false;

  void toggleContainer() {
    setState(() {
      showSecondContainer = !showSecondContainer;
    });
  }

  @override
  Widget build(BuildContext context) {
    final vres = Provider.of<Vehicledetailsprovider>(context, listen: true);
    print("${vres.vehdet?.bodyImage}");
    ProductController.bidController.text =
        vres.vehdet?.vehicle?.price.toString() ?? '';
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.only(top: 35, left: 20, right: 20),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      vres.vehdet?.vehicle?.vehicleName ?? "",
                      style: getSemiBoldStyle(
                          color: Colormanager.black, fontSize: 30),
                    ),
                    Container(
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colormanager.primary,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          "Bid",
                          style: getMediumtStyle(
                              color: Colormanager.white, fontSize: 14),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      "Rs. ${vres.vehdet?.vehicle?.price.toString()}",
                      style: getBoldStyle(
                          color: Colormanager.primary, fontSize: 24),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: CachedNetworkImage(
                        imageUrl:
                            "$endpoint${vres.vehdet?.vehicle?.productimage ?? ""}",
                        height: 180,
                        width: size.width * .9,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) {
                          return Container(
                            color: Colormanager.grey,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DetailCard(
                          text:
                              "Model: ${vres.vehdet?.vehicle?.modelyear.toString()}"),
                      DetailCard(
                          text: "${vres.vehdet?.vehicle?.fueltype.toString()}"),
                      DetailCard(
                          text:
                              "Mileage: ${vres.vehdet?.vehicle?.mileage.toString()}"),
                      DetailCard(
                          text:
                              "OWNER: ${vres.vehdet?.vehicle?.owner.toString()}"),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DetailCard(
                        text:
                            "Location: ${vres.vehdet?.vehicle?.location.toString()}"),
                    DetailCard(
                        text:
                            "Registration: ${vres.vehdet?.vehicle?.registration.toString()}"),
                    DetailCard(
                        text: "${vres.vehdet?.vehicle?.gearshift.toString()}"),
                    DetailCard(
                        text: "RTO: ${vres.vehdet?.vehicle?.rto.toString()}")
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Minimum Bid Amount",
                          style: getSemiBoldStyle(
                              color: Colormanager.black, fontSize: 10),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            "RS. ${vres.vehdet?.vehicle?.minimumbitamount.toString()}",
                            style:
                                getBoldStyle(color: Colors.black, fontSize: 15))
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Starts In",
                          style: getSemiBoldStyle(
                              color: Colormanager.primary, fontSize: 10),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        VehicledetailTimerScreen(),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                vres.vehdet?.vehicle?.type == 'sale'
                    ? BuyNow()
                    : Column(
                        children: const [
                          SizedBox(
                            height: 15,
                          ),
                          BidListTile(),
                        ],
                      ),
                SizedBox(
                  height: 4,
                ),
                SizedBox(
                  height: 15,
                ),
                ExpansionTile(
                  trailing: SizedBox(
                    height: 0,
                  ),
                  tilePadding: EdgeInsets.only(left: 30),
                  title: Container(
                    height: 40,
                    // width: size.width * .5,
                    decoration: BoxDecoration(
                        color: Colormanager.primary,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                        child: Text(
                      "Show Vehicle Parts",
                      style:
                          getBoldStyle(color: Colormanager.white, fontSize: 15),
                    )),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 500,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 245, 245, 245),
                            borderRadius: BorderRadius.circular(20)),
                        child: Stack(
                          children: [
                            Center(
                                child: Image.network(
                              "${vres.vehdet?.bodyImage}",
                              fit: BoxFit.cover,
                            )),
                            Column(
                              children: const [
                                // Padding(
                                //   padding:
                                //       const EdgeInsets.only(left: 0.0, right: 80),
                                //   child: Container(
                                //     height: 20,
                                //     width: 25,
                                //     decoration: BoxDecoration(
                                //       color: const Color(0xffbfd836e),
                                //       borderRadius: BorderRadius.circular(10),
                                //     ),
                                //     child: Center(
                                //         child: Text(
                                //       "E1",
                                //       style: getMediumtStyle(
                                //           color: Colors.white, fontSize: 10),
                                //     )),
                                //   ),
                                // ),
                                // SizedBox(
                                //   height: 68,
                                // ),
                                // Row(
                                //   children: [
                                //     Padding(
                                //       padding: const EdgeInsets.only(left: 60.0),
                                //       child: Container(
                                //         height: 20,
                                //         width: 25,
                                //         decoration: BoxDecoration(
                                //           color: Color(0xffbbdb7368),
                                //           borderRadius: BorderRadius.circular(10),
                                //         ),
                                //         child: Center(
                                //             child: Text(
                                //           "E2",
                                //           style: getMediumtStyle(
                                //               color: Colors.white, fontSize: 10),
                                //         )),
                                //       ),
                                //     ),
                                //     SizedBox(
                                //       width: 40,
                                //     ),
                                //     Padding(
                                //       padding: const EdgeInsets.only(
                                //         left: 13.0,
                                //       ),
                                //       child: Container(
                                //         height: 20,
                                //         width: 28,
                                //         decoration: BoxDecoration(
                                //           color: Color(0xffb6c0bce),
                                //           borderRadius: BorderRadius.circular(10),
                                //         ),
                                //         child: Center(
                                //             child: Text(
                                //           "A2",
                                //           style: getMediumtStyle(
                                //               color: Colors.white, fontSize: 10),
                                //         )),
                                //       ),
                                //     ),
                                //     SizedBox(
                                //       width: 40,
                                //     ),
                                //     Padding(
                                //       padding: const EdgeInsets.only(left: 70.0),
                                //       child: Container(
                                //         height: 20,
                                //         width: 28,
                                //         decoration: BoxDecoration(
                                //           color: Color(0xFFb13a36),
                                //           borderRadius: BorderRadius.circular(10),
                                //         ),
                                //         child: Center(
                                //             child: Text(
                                //           "S2",
                                //           style: getMediumtStyle(
                                //               color: Colors.white, fontSize: 10),
                                //         )),
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // SizedBox(
                                //   height: 45,
                                // ),
                                // Padding(
                                //   padding:
                                //       const EdgeInsets.only(left: 0.0, right: 40),
                                //   child: Container(
                                //     height: 20,
                                //     width: 28,
                                //     decoration: BoxDecoration(
                                //       color: Color(0xffb4c8ee5),
                                //       borderRadius: BorderRadius.circular(10),
                                //     ),
                                //     child: Center(
                                //         child: Text(
                                //       "G1",
                                //       style: getMediumtStyle(
                                //           color: Colors.white, fontSize: 10),
                                //     )),
                                //   ),
                                // ),
                                // Row(
                                //   children: [
                                //     SizedBox(
                                //       height: 2,
                                //     ),
                                //     Padding(
                                //       padding: const EdgeInsets.only(
                                //           left: 50.0, right: 100),
                                //       child: Container(
                                //         height: 20,
                                //         width: 28,
                                //         decoration: BoxDecoration(
                                //           color: Color(0xffbb13a36),
                                //           borderRadius: BorderRadius.circular(10),
                                //         ),
                                //         child: Center(
                                //             child: Text(
                                //           "S2",
                                //           style: getMediumtStyle(
                                //               color: Colors.white, fontSize: 10),
                                //         )),
                                //       ),
                                //     ),
                                //     SizedBox(
                                //       width: 10,
                                //     ),
                                //     Padding(
                                //       padding: const EdgeInsets.only(
                                //           left: 100.0, right: 50),
                                //       child: Container(
                                //         height: 20,
                                //         width: 28,
                                //         decoration: BoxDecoration(
                                //           color: Color(0xffbfd836e),
                                //           borderRadius: BorderRadius.circular(10),
                                //         ),
                                //         child: Center(
                                //             child: Text(
                                //           "E1",
                                //           style: getMediumtStyle(
                                //               color: Colors.white, fontSize: 10),
                                //         )),
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // SizedBox(
                                //   height: 50,
                                // ),
                                // Padding(
                                //   padding: const EdgeInsets.only(
                                //       left: 100.0, right: 100),
                                //   child: Container(
                                //     height: 20,
                                //     width: 28,
                                //     decoration: BoxDecoration(
                                //       color: Color(0xffbfd836e),
                                //       borderRadius: BorderRadius.circular(10),
                                //     ),
                                //     child: Center(
                                //         child: Text(
                                //       "E1",
                                //       style: getMediumtStyle(
                                //           color: Colors.white, fontSize: 10),
                                //     )),
                                //   ),
                                // ),
                                // SizedBox(
                                //   height: 0,
                                // ),
                                // Padding(
                                //   padding:
                                //       const EdgeInsets.only(left: 0.0, right: 240),
                                //   child: Container(
                                //     height: 20,
                                //     width: 28,
                                //     decoration: BoxDecoration(
                                //       color: Color(0xffbfd836e),
                                //       borderRadius: BorderRadius.circular(10),
                                //     ),
                                //     child: Center(
                                //         child: Text(
                                //       "E1",
                                //       style: getMediumtStyle(
                                //           color: Colors.white, fontSize: 10),
                                //     )),
                                //   ),
                                // ),
                                // SizedBox(
                                //   height: 60,
                                // ),
                                // Row(
                                //   children: [
                                //     SizedBox(
                                //       height: 2,
                                //     ),
                                //     Padding(
                                //       padding: const EdgeInsets.only(
                                //           left: 60.0, right: 80),
                                //       child: Container(
                                //         height: 20,
                                //         width: 28,
                                //         decoration: BoxDecoration(
                                //           color: Color(0xffb6c0bce),
                                //           borderRadius: BorderRadius.circular(10),
                                //         ),
                                //         child: Center(
                                //             child: Text(
                                //           "A2",
                                //           style: getMediumtStyle(
                                //               color: Colors.white, fontSize: 10),
                                //         )),
                                //       ),
                                //     ),
                                //     SizedBox(
                                //       width: 10,
                                //     ),
                                //     Padding(
                                //       padding: const EdgeInsets.only(
                                //           left: 100.0, right: 50),
                                //       child: Container(
                                //         height: 20,
                                //         width: 28,
                                //         decoration: BoxDecoration(
                                //           color: Color(0xffb6c0bce),
                                //           borderRadius: BorderRadius.circular(10),
                                //         ),
                                //         child: Center(
                                //             child: Text(
                                //           "A2",
                                //           style: getMediumtStyle(
                                //               color: Colors.white, fontSize: 10),
                                //         )),
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // SizedBox(
                                //   height: 60,
                                // ),
                                // Padding(
                                //   padding:
                                //       const EdgeInsets.only(left: 20.0, right: 50),
                                //   child: Container(
                                //     height: 20,
                                //     width: 28,
                                //     decoration: BoxDecoration(
                                //       color: Color(0xffb6c0bce),
                                //       borderRadius: BorderRadius.circular(10),
                                //     ),
                                //     child: Center(
                                //         child: Text(
                                //       "A2",
                                //       style: getMediumtStyle(
                                //           color: Colors.white, fontSize: 10),
                                //     )),
                                //   ),
                                // ),
                                // SizedBox(
                                //   height: 25,
                                // ),
                                // Padding(
                                //   padding:
                                //       const EdgeInsets.only(left: 0.0, right: 70),
                                //   child: Container(
                                //     height: 20,
                                //     width: 25,
                                //     decoration: BoxDecoration(
                                //       color: Color(0xffbbdb7368),
                                //       borderRadius: BorderRadius.circular(10),
                                //     ),
                                //     child: Center(
                                //         child: Text(
                                //       "E2",
                                //       style: getMediumtStyle(
                                //           color: Colors.white, fontSize: 10),
                                //     )),
                                //   ),
                                // ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(children: const [
                  // Container(
                  //   height: 250,
                  //   width: MediaQuery.of(context).size.width,
                  //   decoration: BoxDecoration(
                  //       color: Colormanager.primary,
                  //       borderRadius: BorderRadius.only(
                  //           topLeft: Radius.circular(30),
                  //           topRight: Radius.circular(30),
                  //           bottomLeft: Radius.circular(40),
                  //           bottomRight: Radius.circular(40))),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       Padding(
                  //         padding: const EdgeInsets.only(top: 20.0, left: 30),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Text(
                  //               vres.vehdet?.vehicle?.vehicleName ?? "",
                  //               style: getSemiBoldStyle(
                  //                   color: Colormanager.white, fontSize: 30),
                  //             ),
                  //             SizedBox(
                  //               height: 10,
                  //             ),
                  //             Text(
                  //               "Rs. ${vres.vehdet?.vehicle?.price.toString()}",
                  //               style: getBoldStyle(
                  //                   color: Colormanager.white, fontSize: 20),
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsets.only(
                  //             bottom: size.height * .18, right: 35),
                  //         child: Container(
                  //             height: 35,
                  //             width: 35,
                  //             decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.circular(20),
                  //                 boxShadow: const [
                  //                   BoxShadow(
                  //                       blurRadius: 5,
                  //                       color: Colormanager.white,
                  //                       spreadRadius: 0,
                  //                       offset: Offset(0, 4))
                  //                 ],
                  //                 color: Colormanager.white),
                  //             child: Icon(
                  //               Icons.favorite,
                  //               color: Colormanager.primary,
                  //             )),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.only(top: size.height * .27, left: 35),
                  //   child: Container(
                  //     height: 180,
                  //     width: MediaQuery.of(context).size.width / 1.2,
                  //     decoration: BoxDecoration(
                  //         color: Colormanager.white,
                  //         borderRadius: BorderRadius.circular(25),
                  //         boxShadow: const [
                  //           BoxShadow(
                  //               blurRadius: 4,
                  //               color: Color.fromARGB(255, 147, 146, 146))
                  //         ]),
                  //     child: Column(
                  //       children: [
                  //         Padding(
                  //           padding: const EdgeInsets.only(top: 80),
                  //           // child: Container(
                  //           // height: 27,
                  //           // width: 67,
                  //           // decoration: BoxDecoration(
                  //           // borderRadius: BorderRadius.circular(15),
                  //           // color: Colors.amber,
                  //           // ),
                  //           // child: Padding(
                  //           // padding: const EdgeInsets.only(left:10.0),
                  //           // child: Row(
                  //           // children: [
                  //           // Icon(Icons.star,color: Colors.white,size:18,),
                  //           // Text(vres.vehdet?.vehicle?.type??"",style: getSemiBoldStyle(color:Colormanager.white,fontSize:15),)
                  //           // ],
                  //           // ),
                  //           // ),
                  //           // ),
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.all(8.0),
                  //           child: Row(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               children: [
                  //                 Container(
                  //                   height: 70,
                  //                   width: 70,
                  //                   decoration: BoxDecoration(
                  //                       color:
                  //                           Color.fromARGB(255, 255, 255, 255),
                  //                       borderRadius:
                  //                           BorderRadius.circular(10)),
                  //                   child: Center(
                  //                     child: Padding(
                  //                       padding: const EdgeInsets.all(8.0),
                  //                       child: Column(
                  //                         children: [
                  //                           Image.asset(
                  //                             'assets/speedometer-icon.png',
                  //                             height: 30,
                  //                             width: 30,
                  //                           ),
                  //                           SizedBox(
                  //                             height: 6,
                  //                           ),
                  //                           Text(
                  //                             vres.vehdet?.vehicle?.gearshift ??
                  //                                 "",
                  //                             style: getMediumtStyle(
                  //                                 color: Colormanager.primary,
                  //                                 fontSize: 10),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 Container(
                  //                   height: 70,
                  //                   width: 70,
                  //                   decoration: BoxDecoration(
                  //                       color:
                  //                           Color.fromARGB(255, 255, 255, 255),
                  //                       borderRadius:
                  //                           BorderRadius.circular(10)),
                  //                   child: Center(
                  //                     child: Padding(
                  //                       padding: const EdgeInsets.all(8.0),
                  //                       child: Column(
                  //                         children: [
                  //                           Image.asset(
                  //                             'assets/car-seat-belt-icon.png',
                  //                             height: 30,
                  //                             width: 30,
                  //                           ),
                  //                           SizedBox(
                  //                             height: 6,
                  //                           ),
                  //                           Text(
                  //                             "5 seats",
                  //                             style: getMediumtStyle(
                  //                                 color: Colormanager.primary,
                  //                                 fontSize: 10),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 Container(
                  //                   height: 70,
                  //                   width: 70,
                  //                   decoration: BoxDecoration(
                  //                       color:
                  //                           Color.fromARGB(255, 255, 255, 255),
                  //                       borderRadius:
                  //                           BorderRadius.circular(10)),
                  //                   child: Center(
                  //                     child: Padding(
                  //                       padding: const EdgeInsets.all(8.0),
                  //                       child: Column(
                  //                         children: [
                  //                           SvgPicture.asset(
                  //                             'assets/drawer_icons/gasoline-pump-svgrepo-com.svg',
                  //                             height: 30,
                  //                             width: 30,
                  //                           ),
                  //                           SizedBox(
                  //                             height: 6,
                  //                           ),
                  //                           Text(
                  //                             vres.vehdet?.vehicle?.fueltype ??
                  //                                 "",
                  //                             style: getMediumtStyle(
                  //                                 color: Colormanager.primary,
                  //                                 fontSize: 10),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ]),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Padding(
                  //       padding:
                  //           EdgeInsets.only(top: size.height * .18, left: 0),
                  //       child: ClipRRect(
                  //         borderRadius: BorderRadius.circular(5),
                  //         child: Image.network(
                  //           "$endpoint${vres.vehdet?.vehicle?.productimage ?? ""}",
                  //           height: 130,
                  //           width: size.width * .75,
                  //           fit: BoxFit.cover,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    // height:isExpanded ? MediaQuery.of(context).size.height*1.2:300,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 238, 238, 238),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 10,
                              color: Color.fromARGB(255, 184, 185, 198))
                        ]),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 30, right: 6, left: 6, bottom: 30),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Card(
                                elevation: 15,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                child: ExpansionTile(
                                  trailing: Container(
                                    height: 37,
                                    width: 37,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: const [
                                          BoxShadow(
                                              blurRadius: 5,
                                              color: Color.fromARGB(
                                                  255, 198, 197, 197),
                                              spreadRadius: 0,
                                              offset: Offset(0, 4))
                                        ],
                                        color: Colormanager.white),
                                    child: Transform.rotate(
                                        angle: 3.14159 * 1.5,
                                        child: Icon(
                                          Icons.arrow_back_ios,
                                          size: 16,
                                          color: Colormanager.primary,
                                        )),
                                  ),
                                  title: Text(
                                    "Overview",
                                    style: getSemiBoldStyle(
                                        color: Colormanager.black,
                                        fontSize: 22),
                                  ),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Container(
                                          color: Colormanager.background,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: Column(children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/NicePng_production-png_8007006.png',
                                                  color: Colormanager.primary,
                                                  height: 25,
                                                  width: 25,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "Registration",
                                                  style: getMediumtStyle(
                                                      fontSize: 13.0,
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                ),
                                                Spacer(),
                                                Text(
                                                  vres.vehdet?.vehicle
                                                          ?.registration
                                                          .toString() ??
                                                      '',
                                                  style: getBoldStyle(
                                                      color: Colors.black),
                                                )
                                              ],
                                            ),
                                            Divider(thickness: 2),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/car-document-icon.png',
                                                  color: Colormanager.primary,
                                                  height: 20,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "Insurance",
                                                  style: getMediumtStyle(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 0, 0, 0),
                                                      fontSize: 13),
                                                ),
                                                Spacer(),
                                                Text(
                                                  vres.vehdet?.vehicle
                                                          ?.insurance
                                                          .toString() ??
                                                      '',
                                                  style: getBoldStyle(
                                                      color: Colors.black),
                                                )
                                              ],
                                            ),
                                            Divider(thickness: 2),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/car_performance-512.png',
                                                  color: Colormanager.primary,
                                                  height: 28,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "Rto",
                                                  style: getMediumtStyle(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 0, 0, 0),
                                                      fontSize: 13),
                                                ),
                                                Spacer(),
                                                Text(
                                                  vres.vehdet?.vehicle?.rto
                                                          .toString() ??
                                                      '',
                                                  style: getBoldStyle(
                                                      color: Colors.black),
                                                )
                                              ],
                                            ),
                                            Divider(thickness: 2),
                                            Row(
                                              children: [
                                                Icon(Icons.monetization_on),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "Tax Upto",
                                                  style: getMediumtStyle(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 0, 0, 0),
                                                      fontSize: 13),
                                                ),
                                                Spacer(),
                                                Text(
                                                  vres.vehdet?.vehicle?.taxupto
                                                          .toString() ??
                                                      '',
                                                  style: getBoldStyle(
                                                      color: Colors.black),
                                                )
                                              ],
                                            ),
                                            Divider(thickness: 2),
                                            Row(
                                              children: [
                                                Icon(Icons.car_crash),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "Fitness Upto",
                                                  style: getMediumtStyle(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 0, 0, 0),
                                                      fontSize: 13),
                                                ),
                                                Spacer(),
                                                Text(
                                                  vres.vehdet?.vehicle
                                                          ?.fitnessupto
                                                          .toString() ??
                                                      '',
                                                  style: getBoldStyle(
                                                      color: Colors.black),
                                                )
                                              ],
                                            ),
                                            Divider(thickness: 2),
                                            Row(
                                              children: [
                                                Icon(Icons.car_crash),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "Vehicle Id",
                                                  style: getMediumtStyle(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 0, 0, 0),
                                                      fontSize: 13),
                                                ),
                                                Spacer(),
                                                Text(
                                                  vres.vehdet?.vehicle
                                                          ?.vehicleIdentificationNumber
                                                          .toString() ??
                                                      '',
                                                  style: getBoldStyle(
                                                      color: Colors.black),
                                                )
                                              ],
                                            ),
                                            Divider(thickness: 2),
                                          ])),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 16.0),
                              Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                child: ExpansionTile(
                                  trailing: Container(
                                    height: 37,
                                    width: 37,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: const [
                                          BoxShadow(
                                              blurRadius: 5,
                                              color: Color.fromARGB(
                                                  255, 198, 197, 197),
                                              spreadRadius: 0,
                                              offset: Offset(0, 4))
                                        ],
                                        color: Colormanager.white),
                                    child: Transform.rotate(
                                        angle: 3.14159 * 1.5,
                                        child: Icon(
                                          Icons.arrow_back_ios,
                                          size: 16,
                                          color: Colormanager.primary,
                                        )),
                                  ),
                                  title: Text(
                                    "Product Images",
                                    style: getSemiBoldStyle(
                                        color: Colormanager.black,
                                        fontSize: 22),
                                  ),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: SizedBox(
                                        height: 150,
                                        width: size.width,
                                        child: ListView.builder(
                                          itemCount: vres
                                              .vehdet?.productimages?.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 8, 8, 8),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: CachedNetworkImage(
                                                  width: 200,
                                                  imageUrl:
                                                      "$endpoint${vres.vehdet?.productimages?[index].productimage}",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                child: ExpansionTile(
                                  trailing: Container(
                                    height: 37,
                                    width: 37,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: const [
                                          BoxShadow(
                                              blurRadius: 5,
                                              color: Color.fromARGB(
                                                  255, 198, 197, 197),
                                              spreadRadius: 0,
                                              offset: Offset(0, 4))
                                        ],
                                        color: Colormanager.white),
                                    child: Transform.rotate(
                                        angle: 3.14159 * 1.5,
                                        child: Icon(
                                          Icons.arrow_back_ios,
                                          size: 16,
                                          color: Colormanager.primary,
                                        )),
                                  ),
                                  title: Text(
                                    "Interiors",
                                    style: getSemiBoldStyle(
                                        color: Colormanager.black,
                                        fontSize: 22),
                                  ),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: SizedBox(
                                        height: 150,
                                        width: size.width,
                                        child: ListView.builder(
                                          itemCount:
                                              vres.vehdet?.interiors?.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 8, 8, 8),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: CachedNetworkImage(
                                                  width: 200,
                                                  imageUrl:
                                                      "$endpoint${vres.vehdet?.interiors?[index].interiorImage}",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                child: ExpansionTile(
                                  trailing: Container(
                                    height: 37,
                                    width: 37,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: const [
                                          BoxShadow(
                                              blurRadius: 5,
                                              color: Color.fromARGB(
                                                  255, 198, 197, 197),
                                              spreadRadius: 0,
                                              offset: Offset(0, 4))
                                        ],
                                        color: Colormanager.white),
                                    child: Transform.rotate(
                                        angle: 3.14159 * 1.5,
                                        child: Icon(
                                          Icons.arrow_back_ios,
                                          size: 16,
                                          color: Colormanager.primary,
                                        )),
                                  ),
                                  title: Text(
                                    "Exteriors",
                                    style: getSemiBoldStyle(
                                        color: Colormanager.black,
                                        fontSize: 22),
                                  ),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: SizedBox(
                                        height: 150,
                                        width: size.width,
                                        child: ListView.builder(
                                          itemCount:
                                              vres.vehdet?.exteriors?.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 8, 8, 8),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: CachedNetworkImage(
                                                  width: 200,
                                                  imageUrl:
                                                      "$endpoint${vres.vehdet?.exteriors?[index].exteriorImage}",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                child: ExpansionTile(
                                  trailing: Container(
                                    height: 37,
                                    width: 37,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: const [
                                          BoxShadow(
                                              blurRadius: 5,
                                              color: Color.fromARGB(
                                                  255, 198, 197, 197),
                                              spreadRadius: 0,
                                              offset: Offset(0, 4))
                                        ],
                                        color: Colormanager.white),
                                    child: Transform.rotate(
                                        angle: 3.14159 * 1.5,
                                        child: Icon(
                                          Icons.arrow_back_ios,
                                          size: 16,
                                          color: Colormanager.primary,
                                        )),
                                  ),
                                  title: Text(
                                    "ACS",
                                    style: getSemiBoldStyle(
                                        color: Colormanager.black,
                                        fontSize: 22),
                                  ),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: SizedBox(
                                        height: 150,
                                        width: size.width,
                                        child: ListView.builder(
                                          itemCount: vres.vehdet?.acs?.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 8, 8, 8),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: CachedNetworkImage(
                                                  width: 200,
                                                  imageUrl:
                                                      "$endpoint${vres.vehdet?.acs?[index].acImage}",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                child: ExpansionTile(
                                  trailing: Container(
                                    height: 37,
                                    width: 37,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: const [
                                          BoxShadow(
                                              blurRadius: 5,
                                              color: Color.fromARGB(
                                                  255, 198, 197, 197),
                                              spreadRadius: 0,
                                              offset: Offset(0, 4))
                                        ],
                                        color: Colormanager.white),
                                    child: Transform.rotate(
                                        angle: 3.14159 * 1.5,
                                        child: Icon(
                                          Icons.arrow_back_ios,
                                          size: 16,
                                          color: Colormanager.primary,
                                        )),
                                  ),
                                  title: Container(
                                    child: Text(
                                      "Description",
                                      style: getSemiBoldStyle(
                                          color: Colormanager.black,
                                          fontSize: 22),
                                    ),
                                  ),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: Column(children: [
                                            Row(
                                              children: [
                                                Container(
                                                    height: 24,
                                                    width: 24,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        boxShadow: const [
                                                          BoxShadow(
                                                              blurRadius: 5,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      198,
                                                                      197,
                                                                      197),
                                                              spreadRadius: 0,
                                                              offset:
                                                                  Offset(0, 4))
                                                        ],
                                                        color: Color.fromARGB(
                                                            255,
                                                            246,
                                                            154,
                                                            160)),
                                                    child: Icon(
                                                      Icons.check_sharp,
                                                      size: 17,
                                                      color:
                                                          Colormanager.primary,
                                                    )),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "Air-conditioning",
                                                  style: getMediumtStyle(
                                                      fontSize: 13.0,
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10.0),
                                            Container(
                                              height: 0.8,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              color: Color.fromARGB(
                                                  255, 158, 155, 155),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                    height: 24,
                                                    width: 24,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        boxShadow: const [
                                                          BoxShadow(
                                                              blurRadius: 5,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      198,
                                                                      197,
                                                                      197),
                                                              spreadRadius: 0,
                                                              offset:
                                                                  Offset(0, 4))
                                                        ],
                                                        color: Color.fromARGB(
                                                            255,
                                                            246,
                                                            154,
                                                            160)),
                                                    child: Icon(
                                                      Icons.check_sharp,
                                                      size: 17,
                                                      color:
                                                          Colormanager.primary,
                                                    )),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "Engine & Transmission",
                                                  style: getMediumtStyle(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 0, 0, 0),
                                                      fontSize: 13),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              height: 0.8,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              color: Color.fromARGB(
                                                  255, 158, 155, 155),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                    height: 24,
                                                    width: 24,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        boxShadow: const [
                                                          BoxShadow(
                                                              blurRadius: 5,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      198,
                                                                      197,
                                                                      197),
                                                              spreadRadius: 0,
                                                              offset:
                                                                  Offset(0, 4))
                                                        ],
                                                        color: Color.fromARGB(
                                                            255,
                                                            246,
                                                            154,
                                                            160)),
                                                    child: Icon(
                                                      Icons.check_sharp,
                                                      size: 17,
                                                      color:
                                                          Colormanager.primary,
                                                    )),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "Electricals & Interior",
                                                  style: getMediumtStyle(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 0, 0, 0),
                                                      fontSize: 13),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              height: 0.8,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              color: Color.fromARGB(
                                                  255, 158, 155, 155),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Center(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 70.0),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 8.0),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "View More Details",
                                                        style: getMediumtStyle(
                                                            color: Colormanager
                                                                .primary,
                                                            fontSize: 14),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Transform.rotate(
                                                          angle: 3.14159 * 1.5,
                                                          child: Icon(
                                                            Icons
                                                                .arrow_back_ios,
                                                            size: 15,
                                                            color: Colormanager
                                                                .primary,
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          ])),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ]))),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
