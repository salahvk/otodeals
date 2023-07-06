import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/data/api/api_endpoint.dart';
import 'package:otodeals/data/models/vehiclelisting.dart';
import 'package:otodeals/data/providers/dataprovider.dart';
import 'package:otodeals/data/providers/vehicleprovider.dart';

import 'package:otodeals/presentation/widgets/Timers/searchupcomingtimer.dart';

import 'package:provider/provider.dart';

class UpcomingbidFunction extends StatelessWidget {

  const UpcomingbidFunction({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final res = Provider.of<Vehicleprovider>(context, listen: true);
    final size = MediaQuery.of(context).size;   final homeres = Provider.of<DataProvider>(context, listen: true);
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: res.vlist?.products?.data?.length ?? 0,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                // inputcurrentlyrunnigbid(index);
                // inputlatestarrivals(index);
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
                                  res.vlist?.upcomingbid?.data![index]
                                          .vehicleName ??
                                      "",
                              style: getMediumtStyle(
                                  color: Colors.black, fontSize: 20)),
                          // Container(
                          //   width: 60,
                          //   height: 20,
                          //   decoration: BoxDecoration(
                          //       color: Colormanager.primary,
                          //       borderRadius: BorderRadius.circular(15)),
                          //   child: Center(
                          //     child: Text(
                          //       "Bid Now",
                          //       style: getMediumtStyle(
                          //           color: Colormanager.white, fontSize: 9),
                          //     ),
                          //   ),
                          // )
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
                               "$endpoint${res.vlist?.upcomingbid?.data![index].image}",
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 80,
                            decoration: BoxDecoration(
                                color: Colormanager.buttonBox,
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                  child: Text(
                              res.vlist?.upcomingbid?.data![index].fueltype ??
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
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                  child: Text(
                                 res.vlist?.upcomingbid?.data![index].gearshift ??
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
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                  child: Text(
                                "Mileage: ${ res.vlist?.upcomingbid?.data![index].mileage ?? ""}"
                                 ,
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
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                  child: Text(
                                "OWNER: ${ res.vlist?.upcomingbid?.data![index].owner ??""}",
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
                                  "RS. ${res.vlist?.upcomingbid?.data![index].price.toString() ?? ""}",
                                  style: getBoldStyle(
                                      color: Colors.black, fontSize: 15))
                            ],
                          ),
                       
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                          SearchtimerupScreen(index:index)
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
        });}}