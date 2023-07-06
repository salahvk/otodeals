import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/data/api/api_endpoint.dart';
import 'package:otodeals/data/models/vehiclelisting.dart';
import 'package:otodeals/data/providers/vehicleprovider.dart';
import 'package:otodeals/presentation/widgets/Timers/searchbidtimer.dart';

import 'package:provider/provider.dart';

class BidFunction extends StatelessWidget {
  final List<VehicleListing> searchResults;
  const BidFunction({Key? key, required this.searchResults}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final res = Provider.of<Vehicleprovider>(context, listen: true);
    final size = MediaQuery.of(context).size;
    // Replace this with your GridViewBuilder implementation for the Bid functionality
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 290,
              // childAspectRatio: 3 / 3,
              crossAxisSpacing: 13,
              mainAxisExtent: size.height * .4,
              mainAxisSpacing: 20),
          itemCount: res.vlist?.products?.data?.length ?? 0,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (ctx) {
                //   return const LoadingListPage();
                // }));
                // final id = homeData![index].id;
                // servicerProvider.serviceId = id;
                // getSubService(context, id);
              },
              child: Container(
                // height:size.height,
                width: size.width / 4,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10.0,
                        color: Colors.grey.shade300,
                        offset: const Offset(2, 2.5),
                      ),
                    ],
                    color: Colormanager.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  res.vlist?.products?.data![index]
                                          .vehicleName ??
                                      "",
                                  style: getSemiBoldStyle(
                                      color: Colors.black, fontSize: 16)),
                              // Container(
                              //   width: 40,
                              //   height: 15,
                              //   decoration: BoxDecoration(
                              //       color: Colormanager.primary,
                              //       borderRadius:
                              //           BorderRadius.circular(15)),
                              //   child: Center(
                              //     child: Text(
                              //       "Bid Now",
                              //       style: getRegularStyle(
                              //           color: Colormanager.white,
                              //           fontSize: 7),
                              //     ),
                              //   ),
                              // )
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Text(
                                  "Rs.${res.vlist?.products?.data![index].price.toString() ?? ""}",
                                  style: getMediumtStyle(
                                      color: Colors.black, fontSize: 14)),
                            ],
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          SizedBox(
                            // color: Colors.amber,
                            // width: size.width,
                            height: size.height / 7.3,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(7),
                              child: CachedNetworkImage(
                                imageUrl:
                                    "$endpoint${res.vlist?.products?.data![index].image}",
                                errorWidget: (context, url, error) {
                                  return Container(
                                    color: Colors.grey,
                                  );
                                },
                                // width: 60,

                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width: 30,
                                  height: 20,
                                  child: Image.asset('assets/petrol.png')),
                              Text(
                                  res.vlist?.products?.data![index].fueltype ??
                                      "",
                                  style: getMediumtStyle(
                                      color: Colormanager.textColor,
                                      fontSize: 13)),
                              Text(
                                  res.vlist?.products?.data![index].gearshift ??
                                      "",
                                  style: getMediumtStyle(
                                      color: Colormanager.textColor,
                                      fontSize: 13)),
                            ],

                            // Text(homeData![index].service ?? '',
                            //     textAlign: TextAlign.center,
                            //     style: getRegularStyle(
                            //         color: Colormanager.primary,
                            //         fontSize:
                            //            10
                            //                )),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   height: 17,
                    // ),
                    Spacer(),
                    Container(
                      // height: 60,
                      width: 255,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 246, 245, 245),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15))),
                      child: SearchtimerScreen(index: index),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
