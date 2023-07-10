import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/routes_manager.dart';
import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/data/api/api_endpoint.dart';

import 'package:otodeals/data/providers/vehicleprovider.dart';
import 'package:otodeals/data/repositories/vehicledetails.dart';
import 'package:otodeals/presentation/screens/productdetails.dart';

import 'package:otodeals/presentation/widgets/Timers/searchbidtimer.dart';
import 'package:otodeals/presentation/widgets/home/redContainer.dart';

import 'package:provider/provider.dart';

class BidFunction extends StatelessWidget {
  const BidFunction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final res = Provider.of<Vehicleprovider>(context, listen: true);
    final size = MediaQuery.of(context).size;
    void inputsearchbidlive(index) async {
      final res = Provider.of<Vehicleprovider>(context, listen: false);
      int? id = res.vlist?.products?.data![index].id;
      res.id = id;
      await getvehicledetails(context, id!);
      Navigator.of(context).push(FadePageRoute(page: Porductdetails()));
    }

    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: res.vlist?.products?.data?.length ?? 0,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final vehicleDetails = res.vlist?.products?.data![index];
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                inputsearchbidlive(index);
              },
              child: Container(
                // height: size.height / 3.7,
                width: size.width / 1.17,
                decoration: BoxDecoration(
                    color: Colormanager.background,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 194, 193, 193)
                            .withOpacity(0.5), // Shadow color
                        spreadRadius: 5, // Spread radius of the shadow
                        blurRadius: 6, // Blur radius of the shadow
                        offset: Offset(0, 3), // Offset of the shadow
                      ),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              res.vlist?.products?.data![index].vehicleName ??
                                  "",
                              style: getMediumtStyle(
                                  color: Colors.black, fontSize: 20)),
                          Container(
                            width: 60,
                            height: 20,
                            decoration: BoxDecoration(
                                color: Colormanager.primary,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text(
                                "Bid Now",
                                style: getMediumtStyle(
                                    color: Colormanager.white, fontSize: 9),
                              ),
                            ),
                          )
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
                                "$endpoint${res.vlist?.products?.data![index].image}",
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
                      Wrap(
                        // runAlignment: WrapAlignment.start,
                        alignment: WrapAlignment.spaceBetween,
                        children: [
                          RedContainer(
                              text:
                                  "Model: ${vehicleDetails?.modelyear.toString()}"),
                          RedContainer(text: vehicleDetails?.fueltype ?? ""),
                          RedContainer(
                              text:
                                  "Mileage: ${vehicleDetails?.mileage.toString()}"),
                          RedContainer(
                              text:
                                  "Owner: ${vehicleDetails?.owner.toString()}"),
                          vehicleDetails?.interiorRating == 0
                              ? Container()
                              : RedContainer(
                                  text:
                                      "Inte Rate : ${vehicleDetails?.interiorRating.toString()}"),
                          vehicleDetails?.exteriorRating == 0
                              ? Container()
                              : RedContainer(
                                  text:
                                      "Exter Rate : ${vehicleDetails?.exteriorRating.toString()}"),
                          vehicleDetails?.engineRating == 0
                              ? Container()
                              : RedContainer(
                                  text:
                                      "Eng Rate : ${vehicleDetails?.interiorRating.toString()}"),
                          vehicleDetails?.damageRating == 0
                              ? Container()
                              : RedContainer(
                                  text:
                                      "Dmg Rate : ${vehicleDetails?.exteriorRating.toString()}"),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Highest Bid",
                                style: getSemiBoldStyle(
                                    color: Colormanager.black, fontSize: 10),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  "RS. ${res.vlist?.products?.data![index].minimumbitamount.toString() ?? ""}",
                                  style: getBoldStyle(
                                      color: Colors.black, fontSize: 15))
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Last Call",
                                style: getSemiBoldStyle(
                                    color: Colormanager.primary, fontSize: 10),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SearchtimerScreen(index: index)
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
        });
    // Replace this with your GridViewBuilder implementation for the Bid functionality
    // return Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: GridView.builder(
    //       shrinkWrap: true,
    //       physics: const NeverScrollableScrollPhysics(),
    //       gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
    //           maxCrossAxisExtent: 290,
    //           // childAspectRatio: 3 / 3,
    //           crossAxisSpacing: 13,
    //           mainAxisExtent: size.height * .4,
    //           mainAxisSpacing: 20),
    //       itemCount: res.vlist?.products?.data?.length ?? 0,
    //       itemBuilder: (context, index) {
    //         return InkWell(
    //           onTap: () {
    //             // Navigator.push(context,
    //             //     MaterialPageRoute(builder: (ctx) {
    //             //   return const LoadingListPage();
    //             // }));
    //             // final id = homeData![index].id;
    //             // servicerProvider.serviceId = id;
    //             // getSubService(context, id);
    //           },
    //           child: Container(
    //             // height:size.height,
    //             width: size.width / 4,
    //             alignment: Alignment.center,
    //             decoration: BoxDecoration(
    //                 boxShadow: [
    //                   BoxShadow(
    //                     blurRadius: 10.0,
    //                     color: Colors.grey.shade300,
    //                     offset: const Offset(2, 2.5),
    //                   ),
    //                 ],
    //                 color: Colormanager.white,
    //                 borderRadius: BorderRadius.circular(20)),
    //             child: Column(
    //               children: [
    //                 Padding(
    //                   padding: const EdgeInsets.all(8.0),
    //                   child: Column(
    //                     // mainAxisAlignment: MainAxisAlignment.center,
    //                     crossAxisAlignment: CrossAxisAlignment.center,
    //                     children: [
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         children: [
    //                           Text(
    //                               res.vlist?.products?.data![index]
    //                                       .vehicleName ??
    //                                   "",
    //                               style: getSemiBoldStyle(
    //                                   color: Colors.black, fontSize: 16)),
    //                           // Container(
    //                           //   width: 40,
    //                           //   height: 15,
    //                           //   decoration: BoxDecoration(
    //                           //       color: Colormanager.primary,
    //                           //       borderRadius:
    //                           //           BorderRadius.circular(15)),
    //                           //   child: Center(
    //                           //     child: Text(
    //                           //       "Bid Now",
    //                           //       style: getRegularStyle(
    //                           //           color: Colormanager.white,
    //                           //           fontSize: 7),
    //                           //     ),
    //                           //   ),
    //                           // )
    //                         ],
    //                       ),
    //                       const SizedBox(
    //                         height: 8,
    //                       ),
    //                       Row(
    //                         children: [
    //                           Text(
    //                               "Rs.${res.vlist?.products?.data![index].price.toString() ?? ""}",
    //                               style: getMediumtStyle(
    //                                   color: Colors.black, fontSize: 14)),
    //                         ],
    //                       ),
    //                       const SizedBox(
    //                         height: 13,
    //                       ),
    //                       SizedBox(
    //                         // color: Colors.amber,
    //                         // width: size.width,
    //                         height: size.height / 7.3,
    //                         child: ClipRRect(
    //                           borderRadius: BorderRadius.circular(7),
    //                           child: CachedNetworkImage(
    //                             imageUrl:
    //                                 "$endpoint${res.vlist?.products?.data![index].image}",
    //                             errorWidget: (context, url, error) {
    //                               return Container(
    //                                 color: Colors.grey,
    //                               );
    //                             },
    //                             // width: 60,

    //                             fit: BoxFit.cover,
    //                           ),
    //                         ),
    //                       ),
    //                       const SizedBox(
    //                         height: 15,
    //                       ),
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         children: [
    //                           SizedBox(
    //                               width: 30,
    //                               height: 20,
    //                               child: Image.asset('assets/petrol.png')),
    //                           Text(
    //                               res.vlist?.products?.data![index].fueltype ??
    //                                   "",
    //                               style: getMediumtStyle(
    //                                   color: Colormanager.textColor,
    //                                   fontSize: 13)),
    //                           Text(
    //                               res.vlist?.products?.data![index].gearshift ??
    //                                   "",
    //                               style: getMediumtStyle(
    //                                   color: Colormanager.textColor,
    //                                   fontSize: 13)),
    //                         ],

    //                         // Text(homeData![index].service ?? '',
    //                         //     textAlign: TextAlign.center,
    //                         //     style: getRegularStyle(
    //                         //         color: Colormanager.primary,
    //                         //         fontSize:
    //                         //            10
    //                         //                )),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 // SizedBox(
    //                 //   height: 17,
    //                 // ),
    //                 Spacer(),
    //                 Container(
    //                   // height: 60,
    //                   width: 255,
    //                   decoration: BoxDecoration(
    //                       color: Color.fromARGB(255, 246, 245, 245),
    //                       borderRadius: BorderRadius.only(
    //                           topLeft: Radius.circular(15),
    //                           topRight: Radius.circular(15))),
    //                   child: SearchtimerScreen(index: index),
    //                 )
    //               ],
    //             ),
    //           ),
    //         );
    //       }),
    // );
  }
}
