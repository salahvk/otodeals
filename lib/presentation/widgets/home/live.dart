import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/routes_manager.dart';
import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/data/api/api_endpoint.dart';
import 'package:otodeals/data/providers/dataprovider.dart';
import 'package:otodeals/data/repositories/vehicledetails.dart';
import 'package:otodeals/presentation/screens/productdetails.dart';
import 'package:provider/provider.dart';

class Live extends StatefulWidget {
  const Live({super.key});

  @override
  State<Live> createState() => _LiveState();
}

class _LiveState extends State<Live> {
  // void inputcurrentlyrunnigbid(index)async {
  //   final homeres = Provider.of<DataProvider>(context, listen:false);
  //   int? id = homeres.homemodel?.currentlyRunning![index].id;
  //   homeres.id = id;
  //  await getvehicledetails(context, id!);

  //   Navigator.of(context).push(FadePageRoute(page: Porductdetails()));
  // }

  @override
  Widget build(BuildContext context) {
    final homeres = Provider.of<DataProvider>(context, listen: true);
    void inputcurrentlyrunnigbid(index) async {
      final homeres = Provider.of<DataProvider>(context, listen: false);
      int? id = homeres.homemodel?.currentlyRunning![index].id;
      homeres.id = id;
      await getvehicledetails(context, id!);

      Navigator.of(context).push(FadePageRoute(page: Porductdetails()));
    }

    final size = MediaQuery.of(context).size;

    return Container(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 10,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
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
                                  "Model: ${homeres.homemodel?.currentlyRunning![index].modelyear.toString()}",
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
                                  homeres.homemodel?.currentlyRunning![index]
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
                                  "Mileage: ${homeres.homemodel?.currentlyRunning![index].mileage.toString()}",
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
                                  "OWNER: ${homeres.homemodel?.currentlyRunning![index].owner.toString()}",
                                  style: getMediumtStyle(
                                      color: Colormanager.buttonText,
                                      fontSize: 10),
                                )),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Highest Bid",
                                style: getMediumtStyle(
                                    color: Colors.black, fontSize: 10),
                              ),
                              Text(
                                "Last Call",
                                style: getMediumtStyle(
                                    color: Colormanager.primary, fontSize: 10),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 10, top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  "RS. ${homeres.homemodel?.currentlyRunning![index].price.toString()}",
                                  style: getBoldStyle(
                                      color: Colors.black, fontSize: 15)),
                              // LivetimerScreen(index)
                            ],
                          ),
                        )
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
