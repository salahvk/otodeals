import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/controllers.dart';
import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/data/api/api_endpoint.dart';
import 'package:otodeals/data/models/vehiclelisting.dart';


import 'package:otodeals/presentation/widgets/Searchfilterdrawer.dart';


import 'package:http/http.dart' as http;

class searchs extends StatefulWidget {
  const searchs({Key? key}) : super(key: key);

  @override
  State<searchs> createState() => _searchsState();
}

class _searchsState extends State<searchs> {
  bool isBuySelected = true;
  String s="abc";
  List<dynamic>allresults=[];
   List<dynamic> searchResults = [];
   void initState(){
    super.initState();
_fetchSearchResults();
     

  }
  
    

  void toggleSelection(bool isBuy)async {
    setState(() {
      isBuySelected = isBuy;
      searchResults.clear();
      _fetchSearchResults();
     
    });}
    Future<void> _fetchSearchResults() async {
        SearchFilters filters = SearchFilters(fuelType:Searchcontroller.fueltypecontroller.text,
        gearshift:Searchcontroller.gearshiftcontroller.text,
        type:Searchcontroller.vehicletypecontroller.text,modelyear:Searchcontroller.modelyearcontroller.text,
        maxPrice:Searchcontroller.maxpricecontroller.text, 
        minPrice:Searchcontroller.minpricecontroller.text);
    final url = '${ApiEndpoint.vehiclelisting}'; // Replace with your actual web service URL

    final response = await http.post(
      Uri.parse(url),headers:{'device-id':s} ,
      body: {
        Searchcontroller.vehicletypecontroller: isBuySelected ? 'sale' : 'bid',
       Searchcontroller.fueltypecontroller:filters.fuelType,
       Searchcontroller.gearshiftcontroller:filters.gearshift,
       Searchcontroller.minpricecontroller:filters.minPrice,
       Searchcontroller.maxpricecontroller:filters.maxPrice,
       Searchcontroller.maxpricecontroller:filters.modelyear
      },
    );
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<VehicleListing> results = [];
       searchResults.addAll(results);

      for (var item in jsonData) {
        final vehicle = VehicleListing(
          type:item['type'],
          price:item['price'],
          gearshift:item['gearshift'],
          fueltype:item['fueltype'],
          modelyear:item['modelyear'],
        );
        results.add(vehicle);
       
      }
    }

   

    }
  

  @override
 
  Widget build(BuildContext context) {
     SearchFilters filters = SearchFilters(fuelType:Searchcontroller.fueltypecontroller.text,
        gearshift:Searchcontroller.gearshiftcontroller.text,
        type:Searchcontroller.vehicletypecontroller.text,modelyear:Searchcontroller.modelyearcontroller.text,
        maxPrice:Searchcontroller.maxpricecontroller.text, 
        minPrice:Searchcontroller.minpricecontroller.text);
    
      // final searchres = Provider.of<DataProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: SingleChildScrollView(
        child: SizedBox(
            height: size.height,
            width: size.width * 0.8,
            child: FilterDrawer(initialFilters:filters, onFiltersChanged: (SearchFilters ) {  },),
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
                              builder: (context)=> InkWell(
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
                            onChanged: (value) {
                              
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search',
                              hintStyle: getSemiBoldStyle(
                                color: Colormanager.textColor,
                                fontSize: 15,
                              ),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colormanager.textColor,
                              ),
                              suffixIcon: const Icon(
                                Icons.location_on_sharp,
                                color: Colormanager.primary,
                              ),
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
                              onTap: () => toggleSelection(true,
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
                              onTap: () => toggleSelection(false),
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
              SizedBox(height:40.0),
              isBuySelected ? BuyFunction(searchResults:[],) : BidFunction(searchResults:[],),
            ],
          ),
        ),
      ),
    );
  }
}

class BuyFunction extends StatelessWidget {
 
    final List<VehicleListing> searchResults;
    const BuyFunction({Key?key,required this.searchResults}):super(key: key);
     @override
    Widget build(BuildContext context) {
      final size = MediaQuery.of(context).size;
    // Replace this with your GridViewBuilder implementation for the Buy functionality
    return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent:300,
                            childAspectRatio: 3 / 3,
                            crossAxisSpacing:16,
                            mainAxisExtent:220,
                            mainAxisSpacing: 20),
                    itemCount:searchResults.length,
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
                          height:200,
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
                                padding: const EdgeInsets.only(top:10.0,left:10.0,right:10.0),
                                child: Column(
                                  
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(searchResults[index].products?.data![index].vehicleName??"",
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
                                        Text(searchResults[index].products?.data![index].price.toString()??"",
                                            style: getMediumtStyle(
                                                color: Colors.black, fontSize: 10)),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: size.width,
                                      height: 110,
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
                                            width: 30,
                                            height:20,
                                            child:
                                                Image.asset('assets/petrol.png')),
                                        Text(searchResults[index].products?.data![index].fueltype??"",
                                            style: getMediumtStyle(
                                                color: Colormanager.textColor,
                                                fontSize: 10)),
                                        Text(searchResults[index].products?.data![index].gearshift??"",
                                            style: getMediumtStyle(
                                                color: Colormanager.textColor,
                                                fontSize: 10)),
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
                });
  }
}

class BidFunction extends StatelessWidget {
      final List<VehicleListing> searchResults;
    const BidFunction({Key?key,required this.searchResults}):super(key: key);

  @override
  Widget build(BuildContext context) {
      final size = MediaQuery.of(context).size;
    // Replace this with your GridViewBuilder implementation for the Bid functionality
    return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent:300,
                            childAspectRatio: 3 / 3,
                            crossAxisSpacing:16,
                            mainAxisExtent:280,
                            mainAxisSpacing: 20),
                    itemCount: searchResults.length,
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
                          height:size.height,
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
                                padding: const EdgeInsets.only(top:10.0,left:10.0,right:10.0),
                                child: Column(
                                  
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(searchResults[index].products?.data![index].vehicleName??"",
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
                                        Text(searchResults[index].products?.data![index].price.toString()??"",
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
                                            width: 30,
                                            height:20,
                                            child:
                                                Image.asset('assets/petrol.png')),
                                        Text(searchResults[index].products?.data![index].fueltype??"",
                                            style: getMediumtStyle(
                                                color: Colormanager.textColor,
                                                fontSize: 10)),
                                        Text(searchResults[index].products?.data![index].gearshift??"",
                                            style: getMediumtStyle(
                                                color: Colormanager.textColor,
                                                fontSize: 10)),
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
                              SizedBox(height:23,),
                                Container(
                                  height: 70,
                                  width: 250,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 254, 254),
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight:Radius.circular(15) )
                  
                                  ),
                                  // child:AttendanceScreen(),
                                )
                            ],
                          ),
                        ),
                      );
                    });
  }
}
