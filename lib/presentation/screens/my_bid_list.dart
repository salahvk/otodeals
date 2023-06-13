import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/styles_manager.dart';

class MyBidList extends StatefulWidget {
  const MyBidList({super.key});

  @override
  State<MyBidList> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<MyBidList> {
  List<bool> isSelected = [true, false];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colormanager.primary,
                      borderRadius: BorderRadius.circular(25)),
                  width: size.width,
                  height: 120,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "MY BID LIST",
                              style: getSemiBoldStyle(
                                  color: Colormanager.white, fontSize: 15),
                            ),
                            Image.asset("assets/menu.png")
                          ],
                        ),
                        Container(
                            width: size.width,
                            height: 35,
                            decoration: BoxDecoration(
                                color: Colormanager.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Search',
                                  hintStyle: getSemiBoldStyle(
                                      color: Colormanager.textColor,
                                      fontSize: 15),
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    color: Colormanager.textColor,
                                  ),
                                  suffixIcon: const Icon(
                                    Icons.location_on_sharp,
                                    color: Colormanager.primary,
                                  )),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: '23',
                        style: getSemiBoldStyle(
                            color: Colormanager.primary, fontSize: 16),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' RESULTS',
                            style: getSemiBoldStyle(
                                color: Colormanager.textColor, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colormanager.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(2, 2.5),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 10,
                        color: Colormanager.primary,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Bid status:",
                      style: getMediumtStyle(color: Colormanager.textColor),
                    ),
                    Text(
                      "Success",
                      style: getMediumtStyle(color: Colormanager.green),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 10, 14, 0),
                child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 210,
                            childAspectRatio: 3 / 3,
                            crossAxisSpacing: 11,
                            mainAxisExtent: 228,
                            mainAxisSpacing: 20),
                    itemCount: 10,
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
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("HYUNDAI",
                                        style: getSemiBoldStyle(
                                            color: Colors.black)),
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
                                    Text("RS 4.64 - 5.99 Lakh",
                                        style: getMediumtStyle(
                                            color: Colors.black, fontSize: 10)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: size.width,
                                  height: 100,
                                  child: CachedNetworkImage(
                                    width: 60,
                                    imageUrl:
                                        "https://wallpapercave.com/wp/wp2060860.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        width: 20,
                                        height: 20,
                                        child:
                                            Image.asset('assets/petrol.png')),
                                    Text("PETROL",
                                        style: getMediumtStyle(
                                            color: Colormanager.textColor,
                                            fontSize: 10)),
                                    Text("35667 KM",
                                        style: getMediumtStyle(
                                            color: Colormanager.textColor,
                                            fontSize: 10)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                   Text("Bid Amount:",style: getMediumtStyle(color:Colors.black,fontSize:12),),
                                    Container(
                                      height:19,
                                      width:57,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colormanager.primary,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left:3.0,right: 3),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Image.asset('assets/tag.png',color: Colormanager.white,height:15,),
                                            Text("90000",style: getMediumtStyle(color:Colormanager.white,fontSize:10),)
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )
                                // Text(homeData![index].service ?? '',
                                //     textAlign: TextAlign.center,
                                //     style: getRegularStyle(
                                //         color: Colormanager.primary,
                                //         fontSize:
                                //            10
                                //                )),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
