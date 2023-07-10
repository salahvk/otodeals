import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/routes_manager.dart';
import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/core/util/bid_diologue.dart';
import 'package:otodeals/data/api/api_endpoint.dart';
import 'package:otodeals/data/providers/dataprovider.dart';
import 'package:otodeals/data/repositories/vehicledetails.dart';
import 'package:otodeals/presentation/screens/productdetails.dart';
import 'package:otodeals/presentation/widgets/Timers/homelivetimer.dart';
import 'package:otodeals/presentation/widgets/home/redContainer.dart';

import 'package:provider/provider.dart';

class Live extends StatefulWidget {
  const Live({super.key});

  @override
  State<Live> createState() => _LiveState();
}

class _LiveState extends State<Live> {
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BidDiologue();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final homeres = Provider.of<DataProvider>(context, listen: false);
    void inputcurrentlyrunnigbid(index) async {
      final homeres = Provider.of<DataProvider>(context, listen:false);
      int? id = homeres.homemodel?.currentlyRunning![index].id;
      homeres.id = id;
      await getvehicledetails(context, id!);
      Navigator.pushNamed(context,Routes.productdetailscreen);
    }

    final size = MediaQuery.of(context).size;

    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final vehicleDetails = homeres.homemodel?.currentlyRunning![index];
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                inputcurrentlyrunnigbid(index);
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
                              homeres.homemodel?.currentlyRunning![index]
                                      .vehicleName ??
                                  "",
                              style: getMediumtStyle(
                                  color: Colors.black, fontSize: 20)),
                          InkWell(
                            onTap: () => _showDialog(context),
                            child: Container(
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
                                "$endpoint${homeres.homemodel?.currentlyRunning?[index].image}",
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
                                  "RS. ${homeres.homemodel?.currentlyRunning![index].price.toString()}",
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
                              LivetimerScreen(index)
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
  }
}
