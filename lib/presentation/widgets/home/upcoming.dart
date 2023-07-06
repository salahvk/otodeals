import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/routes_manager.dart';
import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/data/api/api_endpoint.dart';
import 'package:otodeals/data/providers/dataprovider.dart';
import 'package:otodeals/data/repositories/vehicledetails.dart';
import 'package:otodeals/presentation/screens/productdetails.dart';
import 'package:otodeals/presentation/widgets/timer.dart';
import 'package:provider/provider.dart';

class Upcoming extends StatefulWidget {
  const Upcoming({super.key});

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  void inputbidnow(index) async {
    final homeres = Provider.of<DataProvider>(context, listen: false);
    int? id = homeres.homemodel?.bidVehicles![index].id;
    homeres.id = id;
    await getvehicledetails(context, id!);
    Navigator.of(context).push(FadePageRoute(page: Porductdetails()));
  }

  @override
  Widget build(BuildContext context) {
    final homeres = Provider.of<DataProvider>(context, listen: true);
    void inputbidnow(index) async {
      final homeres = Provider.of<DataProvider>(context, listen: false);
      int? id = homeres.homemodel?.bidVehicles![index].id;
      homeres.id = id;
      await getvehicledetails(context, id!);
      Navigator.of(context).push(FadePageRoute(page: Porductdetails()));
    }

    final size = MediaQuery.of(context).size;

    return Container(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: homeres.homemodel?.bidVehicles?.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  inputbidnow(index);
                  // inputlatestarrivals(index);
                },
                child: Container(
                  // height: size.height / 3.6,
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
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                homeres.homemodel?.bidVehicles![index]
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
                            child: Image.network(
                              "$endpoint${homeres.homemodel?.bidVehicles?[index].image}",
                              fit: BoxFit.cover,
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
                                  "Model: ${homeres.homemodel?.bidVehicles![index].modelyear.toString()}",
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
                                  homeres.homemodel?.bidVehicles![index]
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
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Center(
                                    child: Text(
                                  "Mileage: ${homeres.homemodel?.bidVehicles![index].mileage.toString()}",
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
                                  "Owner: ${homeres.homemodel?.currentlyRunning![index].owner.toString()}",
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
                                    "RS. ${homeres.homemodel?.bidVehicles![index].price.toString()}",
                                    style: getBoldStyle(
                                        color: Colors.black, fontSize: 15))
                              ],
                            ),
                            SizedBox(
                              width: size.width / 4.2,
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
                                AttendanceScreen(index),
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
    );
  }
}
