import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/routes_manager.dart';
import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/data/api/api_endpoint.dart';
import 'package:otodeals/data/providers/dataprovider.dart';
import 'package:otodeals/data/repositories/vehicledetails.dart';
import 'package:otodeals/presentation/screens/productdetails.dart';
import 'package:otodeals/presentation/widgets/buypopup.dart';
import 'package:otodeals/presentation/widgets/home/redContainer.dart';
import 'package:provider/provider.dart';

class Buy extends StatefulWidget {
  const Buy({super.key});

  @override
  State<Buy> createState() => _BuyState();
}

class _BuyState extends State<Buy> {
  void inputlatestarrivals(index) async {
    final homeres = Provider.of<DataProvider>(context, listen: false);
    int? id = homeres.homemodel?.saleVehicles![index].id;
    homeres.id = id;
    await getvehicledetails(context, id!);
    print("aaaaa");

    Navigator.of(context).push(FadePageRoute(page: Porductdetails()));
  }
   void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return  PopupWindow();
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    final homeres = Provider.of<DataProvider>(context, listen: true);

    final size = MediaQuery.of(context).size;
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: homeres.homemodel?.saleVehicles?.length ?? 0,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final vehicleDetails = homeres.homemodel?.saleVehicles![index];
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                inputlatestarrivals(index);
              },
              child: Container(
                width: size.width / 1.17,
                decoration: BoxDecoration(
                    color: Colormanager.background,
                    borderRadius: BorderRadius.circular(20),
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
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0, left: 8),
                            child: Text(
                                homeres.homemodel?.saleVehicles![index]
                                        .vehicleName ??
                                    "",
                                style: getMediumtStyle(
                                    color: Colors.black, fontSize: 20)),
                          ),
                          // InkWell(
                          //   onTap: () => _showDialog(context),
                          //   child: Padding(
                          //     padding:
                          //         const EdgeInsets.only(right: 8.0, top: 5),
                          //     child: Container(
                          //       width: 60,
                          //       height: 20,
                          //       decoration: BoxDecoration(
                          //           color: Colormanager.primary,
                          //           borderRadius: BorderRadius.circular(15)),
                          //       child: Center(
                          //         child: Text(
                          //           "Buy Now",
                          //           style: getSemiBoldStyle(
                          //               color: Colormanager.white,
                          //               fontSize: 10),
                          //         ),
                          //       ),
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
                                "$endpoint${homeres.homemodel?.saleVehicles?[index].image}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Wrap(
                        // runAlignment: WrapAlignment.start,
                        alignment: WrapAlignment.spaceBetween,
                        children: [
                          RedContainer(
                              text:
                                  "Model: ${vehicleDetails?.modelyear.toString()}"),
                          RedContainer(
                              text: homeres.homemodel?.currentlyRunning![index]
                                      .fueltype ??
                                  ""),
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
                                      "Interior Rating : ${vehicleDetails?.interiorRating.toString()}",israting: true,),
                          vehicleDetails?.exteriorRating == 0
                              ? Container()
                              : RedContainer(
                                  text:
                                      "Exterior Rating : ${vehicleDetails?.exteriorRating.toString()}",israting: true,),
                          vehicleDetails?.engineRating == 0
                              ? Container()
                              : RedContainer(
                                  text:
                                      "Engine Rating : ${vehicleDetails?.interiorRating.toString()}",israting: true,),
                          vehicleDetails?.damageRating == 0
                              ? Container()
                              : RedContainer(
                                  text:
                                      "Damage Rating : ${vehicleDetails?.exteriorRating.toString()}",israting: true,),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Price",
                              style: getMediumtStyle(
                                  color: Colors.black, fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 12, bottom: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                "RS. ${homeres.homemodel?.saleVehicles![index].price.toString()}",
                                style: getBoldStyle(
                                    color: Colors.black, fontSize: 15)),
                            InkWell(
                              onTap: ()=>_showDialog(context),
                               
                              
                              child: Container(
                                // width: 70,
                                // height: 17,
                                decoration: BoxDecoration(
                                    color: Colormanager.primary,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      "Request to Buy",
                                      style: getSemiBoldStyle(
                                          color: Colormanager.white,
                                          fontSize: 10),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
