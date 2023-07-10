import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/data/api/api_endpoint.dart';

import 'package:otodeals/data/providers/vehicleprovider.dart';
import 'package:otodeals/data/repositories/vehicledetails.dart';
import 'package:otodeals/presentation/screens/productdetails.dart';
import 'package:provider/provider.dart';

import '../../../core/routes_manager.dart';

class BuyFunction extends StatelessWidget {
 
  const BuyFunction({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final res = Provider.of<Vehicleprovider>(context, listen: true);
    final size = MediaQuery.of(context).size;   
     void inputsearchbuylive(index)async{
     final res = Provider.of<Vehicleprovider>(context, listen:false);
     int? id= res.vlist?.products?.data![index].id;
     res.id=id;
     await getvehicledetails(context, id!);
      Navigator.of(context).push(FadePageRoute(page: Porductdetails()));
    }
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
                inputsearchbuylive(index);
              
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
                                  res.vlist?.products?.data![index]
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
                              res.vlist?.products?.data![index].fueltype ??
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
                                 res.vlist?.products?.data![index].gearshift ??
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
                                "Mileage: ${ res.vlist?.products?.data![index].mileage ?? ""}"
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
                                "OWNER: ${ res.vlist?.products?.data![index].owner ??""}",
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
                                "Highest Bid",
                                style: getSemiBoldStyle(
                                    color: Colormanager.black, fontSize: 10),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  "RS. ${res.vlist?.products?.data![index].price.toString() ?? ""}",
                                  style: getBoldStyle(
                                      color: Colors.black, fontSize: 15))
                            ],
                          ),
                       
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text(
                              //   "Last Call",
                              //   style: getSemiBoldStyle(
                              //       color: Colormanager.primary,
                              //       fontSize: 10),
                              // ),
                              SizedBox(
                                height: 10,
                              ),
                           InkWell(
                                onTap: () {},
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
