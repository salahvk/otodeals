import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/data/api/api_endpoint.dart';
import 'package:otodeals/data/models/vehiclelisting.dart';
import 'package:otodeals/data/providers/vehicleprovider.dart';
import 'package:provider/provider.dart';

class BuyFunction extends StatelessWidget {
  final List<VehicleListing> searchResults;
  const BuyFunction({Key? key, required this.searchResults}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final res = Provider.of<Vehicleprovider>(context, listen: true);
    final size = MediaQuery.of(context).size;
    final l = res.vlist?.products?.data?.length;
    print(l);

    // Replace this with your GridViewBuilder implementation for the Buy functionality
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 3 / 3,
              crossAxisSpacing: 16,
              mainAxisExtent: 220,
              mainAxisSpacing: 20),
          itemCount: res.vlist?.products?.data?.length ?? 0,
          itemBuilder: (BuildContext ctx, index) {
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
                    height: 200,
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
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 10.0, right: 10.0),
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
                                        color: Colors.black, fontSize: 15)),
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
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                    "Rs.${res.vlist?.products?.data![index].price.toString() ?? ""}",
                                    style: getMediumtStyle(
                                        color: Colors.black, fontSize: 13)),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              // color: Colors.amber,
                              // width: size.width,
                              height: size.height / 8,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(7),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "$endpoint${res.vlist?.products?.data![index].image}",
                                  // width: 60,
                                  errorWidget: (context, url, error) {
                                    return Container(
                                      color: Colors.grey,
                                    );
                                  },
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
                                    res.vlist?.products?.data![index]
                                            .fueltype ??
                                        "",
                                    style: getMediumtStyle(
                                        color: Colormanager.textColor,
                                        fontSize: 13)),
                                Text(
                                    res.vlist?.products?.data![index]
                                            .gearshift ??
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
                            ),
                          ],
                        ),
                      ),
                    ])));
          }),
    );
  }
}
