import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/controllers.dart';
import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/data/api/api_endpoint.dart';
import 'package:otodeals/data/models/vehiclelisting.dart';
import 'package:otodeals/data/providers/vehicleprovider.dart';
import 'package:otodeals/data/repositories/vehiclelisting.dart';

import 'package:otodeals/presentation/widgets/Searchfilterdrawer.dart';

import 'package:otodeals/presentation/widgets/Timers/searchbidtimer.dart';

import 'package:provider/provider.dart';

class Searchs extends StatefulWidget {
  const Searchs({Key? key}) : super(key: key);

  @override
  State<Searchs> createState() => _SearchsState();
}

class _SearchsState extends State<Searchs> {
  bool isBuySelected = true;
  String s = "abc";
  // List<dynamic>allresults=[];
  //  List<dynamic> searchResults = [];
  final searchdata = Searchcontroller.searchdatacontroller.text;

  String? type;
  @override
  void initState() {
    Searchcontroller.vehicletypecontroller.text = "sale";
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await fetchSearchResults(context);
    });
  }

  void toggleSelection(bool isBuy) async {
    setState(() {
      isBuySelected = isBuy;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final res=Provider.of<Vehicleprovider>(context,listen: false);
    // final searchres = Provider.of<DataProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: SingleChildScrollView(
        child: SizedBox(
          // height: size.height,
          width: size.width * 0.8,
          child: FilterDrawer(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colormanager.primary,
                    borderRadius: BorderRadius.circular(25),
                  ),
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
                              "CHOOSE A CAR",
                              style: getSemiBoldStyle(
                                color: Colormanager.white,
                                fontSize: 15,
                              ),
                            ),
                            Builder(
                              builder: (context) => InkWell(
                                  onTap: () {
                                    Scaffold.of(context).openEndDrawer();
                                  },
                                  child: Image.asset("assets/menu.png")),
                            ),
                          ],
                        ),
                        Container(
                          width: size.width,
                          height: 35,
                          decoration: BoxDecoration(
                            color: Colormanager.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            controller: Searchcontroller.searchdatacontroller,
                            // onChanged: (value) {

                            // },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search',
                              hintStyle: getSemiBoldStyle(
                                color: Colormanager.textColor,
                                fontSize: 15,
                              ),
                              prefixIcon: InkWell(
                                onTap: () {
                                  fetchSearchResults(context);
                                },
                                child: const Icon(
                                  Icons.search,
                                  color: Colormanager.textColor,
                                ),
                              ),
                              // suffixIcon: const Icon(
                              //   Icons.location_on_sharp,
                              //   color: Colormanager.primary,
                              // ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    Text(
                      "23",
                      style: getSemiBoldStyle(
                        color: Colormanager.primary,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "RESULTS",
                      style: getSemiBoldStyle(
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      width: 123,
                    ),
                    Container(
                      width: 90.0,
                      height: 25.0,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 169, 20, 20),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                      ),
                      child: Stack(
                        children: [
                          AnimatedAlign(
                            alignment: isBuySelected
                                ? Alignment(-1, 0)
                                : Alignment(1, 0),
                            duration: Duration(milliseconds: 300),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Container(
                                width: 45.0,
                                height: 25.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(-1, 0),
                            child: GestureDetector(
                              onTap: () => toggleSelection(
                                true,
                              ),
                              child: Container(
                                width: 45.0,
                                color: Colors.transparent,
                                alignment: Alignment.center,
                                child: Text(
                                  'BUY',
                                  style: TextStyle(
                                    color: isBuySelected
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(1, 0),
                            child: GestureDetector(
                              onTap: () async {
                                toggleSelection(false);
                                Searchcontroller.vehicletypecontroller.text =
                                    "bid";
                                await fetchSearchResults(context);
                              },
                              child: Container(
                                width: 45.0,
                                color: Colors.transparent,
                                alignment: Alignment.center,
                                child: Text(
                                  'BID',
                                  style: TextStyle(
                                    color: isBuySelected
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.0),
              isBuySelected
                  ? BuyFunction(
                      searchResults: const [],
                    )
                  : BidFunction(
                      searchResults: const [],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

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
                                child: Image.network(
                                  "$endpoint${res.vlist?.products?.data![index].image}",
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
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 290,
              childAspectRatio: 3 / 3,
              crossAxisSpacing: 13,
              mainAxisExtent: 279,
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
                              child: Image.network(
                                "$endpoint${res.vlist?.products?.data![index].image}",
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
                    SizedBox(
                      height: 17,
                    ),
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
