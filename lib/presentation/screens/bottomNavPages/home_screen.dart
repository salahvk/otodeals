


import 'package:otodeals/core/routes_manager.dart';



import 'package:flutter/material.dart';

import 'package:otodeals/core/asset_manager.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/data/api/api_endpoint.dart';
import 'package:otodeals/data/providers/dataprovider.dart';

import 'package:otodeals/data/repositories/vehicledetails.dart';

import 'package:otodeals/presentation/screens/my_bid_list.dart';
import 'package:otodeals/presentation/screens/productdetails.dart';
import 'package:otodeals/presentation/widgets/custom_drawer.dart';
import 'package:otodeals/presentation/widgets/timer.dart';
import 'package:otodeals/presentation/widgets/timer2.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState(){
    super.initState();
    
  }
  

  void inputcurrentlyrunnigbid(index){
    
     final homeres = Provider.of<DataProvider>(context, listen: false);
     int? id=homeres.homemodel?.currentlyRunning![index].id; 
     homeres.id=id;
     getvehicledetails(context,id!);
      Navigator.of(context).push(FadePageRoute(page:Porductdetails()));
    
  }
  void inputlatestarrivals(index){
     final homeres = Provider.of<DataProvider>(context, listen: false);
     int? id=homeres.homemodel?.saleVehicles![index].id; 
      homeres.id=id;
     getvehicledetails(context,id!);
      Navigator.of(context).push(FadePageRoute(page:Porductdetails()));
  }
   void inputbidnow(index){
     final homeres = Provider.of<DataProvider>(context, listen: false);
     int? id=homeres.homemodel?.bidVehicles![index].id; 
      homeres.id=id;
     getvehicledetails(context,id!);
      Navigator.of(context).push(FadePageRoute(page:Porductdetails()));
  }
  
  
  
  int current = 0;

  @override
  Widget build(BuildContext context) {
    
    
    final size = MediaQuery.of(context).size;
  
    final homeres = Provider.of<DataProvider>(context, listen:true);
    print(homeres.homemodel?.currentlyRunning?.length);
    // final homedata=provider.homemodel!.result;
  
    return Scaffold(
        endDrawer: SizedBox(
          height: size.height,
          width: size.width * 0.7,
          child: const CustomDrawer(),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: size.width * .4,
                          height: 40,
                          child: Image.asset(AssetImages.logoBlack)),
                      Builder(
                        builder: (context) => InkWell(
                          onTap: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                          child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset("assets/menu.png")),
                        ),
                      )
                    ],
                  ),
                  Container(
                    height:200 ,
                    width: size.width,
                    color: Colormanager.background,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top:10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                 Text("Drive Your",style: getMediumtStyle(color:const Color.fromARGB(255, 0, 0, 0),fontSize:30),),
                                    Row(
                                      children: [
                                        Text("Dreams",style: getMediumtStyle(color:Colormanager.primary,fontSize:30),),
                                            SizedBox(width:8,),
                                   Image.asset('assets/slide_layer.png',height:24,),
                                   
                                      ],
                                    ),
                                    SizedBox(height: 15,),
                                       Text("Selling your car amid a hectic schedule is a challenging task.\nWe are here to help you sell used premium cars through\n our luxurious and grand showroom at Calicut\n having an obsessed team to assist you with years of\nexperience and reputation in the automobile business.  ",
                                                                    style: getRegularStyle(color:Colormanager.black,fontSize:8), ),
                                ],
                              ),
                            ),
                            Image.asset("assets/oto.jpg",height:200,width:130,)
                          ],
                        )
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   width: size.width,
                  //   child: CarouselSlider(
                  //     items: imageSliders,
                  //     carouselController: _controller,
                  //     options: CarouselOptions(
                  //         autoPlay: true,
                  //         enlargeCenterPage: true,
                  //         aspectRatio: 2.0,
                  //         onPageChanged: (index, reason) {
                  //           setState(() {
                  //             current = index;
                  //           });
                  //         }),
                  //   ),
                  // ),
                  const SizedBox(
                    height:25,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       "TOP BRANDS",
                  //       style: getSemiBoldStyle(
                  //           color: Colormanager.textColor, fontSize: 16),
                  //     ),
                  //     const SizedBox(
                  //       height: 15,
                  //     ),
                  //     Container(
                  //       width: 25,
                  //       height: 25,
                  //       decoration: BoxDecoration(
                  //         shape: BoxShape.circle,
                  //         color: Colormanager.white,
                  //         boxShadow: [
                  //           BoxShadow(
                  //             color: Colors.grey.shade300,
                  //             spreadRadius: 1,
                  //             blurRadius: 3,
                  //             offset: const Offset(2, 2.5),
                  //           ),
                  //         ],
                  //       ),
                  //       child: const Icon(
                  //         Icons.arrow_forward_ios,
                  //         size: 10,
                  //         color: Colormanager.primary,
                  //       ),
                  //     )
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height:20,
                  // ),
                  // SizedBox(
                  //   height: 60,
                  //   child: ListView.builder(
                  //     scrollDirection: Axis.horizontal,
                  //     itemBuilder: (context, index) {
                  //       return Padding(
                  //         padding: const EdgeInsets.only(
                  //             top: 5, bottom: 5, right: 5),
                  //         child: ClipRRect(
                  //           borderRadius: BorderRadius.circular(6),
                            
                  //           child:Image.network(
                  //             "$endpoint${homeres.vbrands?.brands![index].image??""}",
                  //             width: 80,
                              
                  //             fit: BoxFit.cover,
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //     itemCount:6,
                  //   ),
                  // ),
                  const SizedBox(
                    height:20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'CURRENTLY RUNNING',
                          style: getSemiBoldStyle(
                              color: Colormanager.textColor, fontSize: 16),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' BIDS',
                              style: getSemiBoldStyle(
                                  color: Colormanager.primary, fontSize: 16),
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
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    height: size.height * .28,
                    width: size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top:5, right: 20),
                          child: InkWell(
                            onTap: (){
                              inputcurrentlyrunnigbid(index);
                             
                            },
                            child: Container(
                              height: size.height*.25,
                              width: size.width/2,
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
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(homeres.homemodel?.currentlyRunning![index].vehicleName??"",
                                            style: getSemiBoldStyle(
                                                color: Colors.black)),
                                        Container(
                                          width: 40,
                                          height: 15,
                                          decoration: BoxDecoration(
                                              color: Colormanager.primary,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Center(
                                            child: Text(
                                              "Bid Now",
                                              style: getRegularStyle(
                                                  color: Colormanager.white,
                                                  fontSize: 7),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height:8,
                                    ),
                                    Row(
                                      children: [
                                        Text(homeres.homemodel?.currentlyRunning![index].price.toString()??"",
                                            style: getMediumtStyle(
                                                color: Colors.black,
                                                fontSize: 10)),
                                      ],
                                    ),
                                    const SizedBox(
                                      height:20,
                                    ),
                                    SizedBox(
                                      width: size.width/1.2,
                                      height:90,
                                      child: Image.network("$endpoint ${homeres.homemodel?.currentlyRunning?[index].image}")
                                    ),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                            width:22,
                                            height:18,
                                            child: Image.asset(
                                                'assets/petrol.png')),
                                        Text(homeres.homemodel?.currentlyRunning![index].fueltype??"",
                                            style: getMediumtStyle(
                                                color: Colormanager.textColor,
                                                fontSize: 10)),
                                        Row(
                                          children: [
                                            Icon(Icons.timelapse,size: 15,),
                                            SizedBox(width: 5,),
                                            Text(homeres.homemodel?.currentlyRunning![index].starttime??"",
                                                style: getMediumtStyle(
                                                    color: Colormanager.textColor,
                                                    fontSize: 10)),
                                                   
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height:5,
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
                          ));
                      },
                      itemCount:homeres.homemodel?.currentlyRunning?.length,
                    ),
                  ),
                  // SizedBox(
                  //   height: size.height *.28,
                  //   child: ListView.builder(
                  //     scrollDirection: Axis.horizontal,
                  //     itemBuilder: (context, index) {
                  //       return Padding(
                  //         padding: const EdgeInsets.only(
                  //             top: 5, bottom: 5, right: 20),
                  //         child: InkWell(
                  //           onTap: () {
                  //             Navigator.of(context).push(FadePageRoute(page:Porductdetails()));
                  //           },
                  //           child: Container(
                  //             height: size.height*.24,
                  //             width: size.width/1.9,
                  //             color: Colors.white,
                  //             child: Stack(
                                
                  //                 children:[ Container(
                  //                 height:140,
                  //                 width:size.width, 
                  //                 decoration: BoxDecoration(
                  //                 color: Colormanager.primary,
                  //                 borderRadius:
                  //                 BorderRadius.only(topLeft:Radius.circular(10),topRight:Radius.circular(10),bottomLeft:Radius.circular(20),bottomRight:
                  //                 Radius.circular(20) )
                                  
                  //                 ),
                  //                 child: Row(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                 Padding(
                  //                 padding: const EdgeInsets.only(top:5.0,left:10),
                  //                 child: Column(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                 Text(homeres.homemodel?.saleVehicles?[index].vehicleName??"",style: getSemiBoldStyle(color: Colormanager.white,fontSize:14),),
                  //                 SizedBox(height:3,),
                  //                 Text(homeres.homemodel?.saleVehicles?[index].price.toString()??"",style: getBoldStyle(color: Colormanager.white,fontSize:12),)
                  //                 ],
                  //                 ),
                  //                 ),
                  //                 Padding(
                  //                 padding: const EdgeInsets.only(left:110.0,top:13),
                  //                 child: Container(
                  //                 height:20,
                  //                 width: 20,
                  //                 decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.circular(10),
                                  
                  //                 boxShadow:[
                  //                 BoxShadow(
                  //                 blurRadius:5,
                  //                 color:Colormanager.white,
                  //                 spreadRadius:0,
                  //                 offset: Offset(0,4))],
                  //                 color: Colormanager.white
                  //                 ),
                  //                 child:Icon(Icons.favorite,size:17,color: Colormanager.primary,)),
                  //                 )
                                  
                  //                 ],
                  //                 ),
                  //                 ),
                  //                 Padding(
                  //                 padding: const EdgeInsets.only(top:80.0),
                  //                 child: Container(
                  //                 height:size.height/3,
                  //                 width: MediaQuery.of(context).size.width/1.5,
                          
                  //                 decoration: BoxDecoration(
                  //                 color:Colormanager.white,
                  //                 borderRadius:
                  //                 BorderRadius.only(topLeft:Radius.circular(40),topRight:Radius.circular(40),bottomLeft:Radius.circular(10),bottomRight:Radius.circular(10)),
                  //                 boxShadow: [
                  //                 BoxShadow(
                  //                 blurRadius:4,
                  //                 color: Color.fromARGB(255, 147, 146, 146)
                          
                  //                 )
                  //                 ]
                  //                 ),
                  //                 child: Column(
                  //                   mainAxisAlignment:MainAxisAlignment.start,
                  //                 children: [
                  //                 // Padding(
                  //                 // padding: const EdgeInsets.only(top:45),
                  //                 // child: Container(
                  //                 // height:22,
                  //                 // width: 37,
                  //                 // decoration: BoxDecoration(
                  //                 // borderRadius: BorderRadius.circular(15),
                  //                 // color: Colors.amber,
                  //                 // ),
                  //                 // child: Padding(
                  //                 // padding: const EdgeInsets.only(left:5.0, ),
                  //                 // child: Row(
                  //                 // children: [
                  //                 // Icon(Icons.star,color: Colors.white,size:10,),
                  //                 // Text(homeres.homemodel?.saleVehicles?[index].,style: getSemiBoldStyle(color:Colormanager.white,fontSize:10),)
                  //                 // ],
                  //                 // ),
                  //                 // ),
                  //                 // ),
                  //                 // ),
                  //                 SizedBox(height:50,),
                  //                 Padding(
                  //                 padding: const EdgeInsets.all(2.0),
                  //                 child: Row(
                  //                 children:[
                  //                 Padding(
                  //                 padding: const EdgeInsets.only(left:30.0),
                  //                 child: Container(
                  //                 height:50 ,
                  //                 width: 50,
                  //                 decoration: BoxDecoration(
                  //                 color: Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.circular(10)),
                  //                 child: Center(
                  //                 child: Padding(
                  //                 padding: const EdgeInsets.all(2.0),
                  //                 child: Column(
                  //                 children: [
                  //                 Image.asset('assets/speedometer-icon.png',height:15,width:15,),
                  //                 SizedBox(
                  //                 height:2,
                  //                 ),
                          
                  //                 Text(homeres.homemodel?.saleVehicles?[index].gearshift??"", style:getSemiBoldStyle(color:Colormanager.primary,fontSize:8),),
                  //                 ],
                  //                 ),
                  //                 ),
                  //                 ),
                  //                 ),
                  //                 ),
                  //                 Container(
                  //                 height:50 ,
                  //                 width: 50,
                  //                 decoration: BoxDecoration(
                  //                 color: Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.circular(10)),
                  //                 child: Center(
                  //                 child: Padding(
                  //                 padding: const EdgeInsets.all(2.0),
                  //                 child: Column(
                  //                 children: [
                  //                 Image.asset('assets/car-seat-belt-icon.png',height:15,width:15,),
                  //                 SizedBox(
                  //                 height:2,
                  //                 ),
                          
                  //                 Text("5 seats", style:getSemiBoldStyle(color:Colormanager.primary,fontSize:8),),
                  //                 ],
                  //                 ),
                  //                 ),
                  //                 ),
                  //                 ),
                  //                 Container(
                  //                 height:50 ,
                  //                 width: 50,
                  //                 decoration: BoxDecoration(
                  //                 color: Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.circular(10)),
                  //                 child: Center(
                  //                 child: Padding(
                  //                 padding: const EdgeInsets.all(2.0),
                  //                 child: Column(
                  //                 children: [
                  //                 SvgPicture.asset('assets/drawer_icons/gasoline-pump-svgrepo-com.svg',height:15,width:15,),
                  //                 SizedBox(
                  //                 height:2,
                  //                 ),
                          
                  //                 Text(homeres.homemodel?.saleVehicles?[index].fueltype ??"" , style:getSemiBoldStyle(color:Colormanager.primary,fontSize:8),),
                  //                 ],
                  //                 ),
                  //                 ),
                  //                 ),
                  //                 ),
                  //                 ]),
                  //                 )
                          
                  //                 ],
                  //                 ),
                          
                          
                  //                 ),
                  //                 ),
                  //                 Padding(
                  //                 padding: const EdgeInsets.only(left:35,right:3,bottom:30,top:20),
                  //                 child: Image.network("$endpoint ${homeres.homemodel?.saleVehicles?[index].image}",height:120,width:120,),
                  //                 ),
                  //                 ]),),
                  //         )
                  //       );
                  //     },
                  //     itemCount:homeres.homemodel?.saleVehicles?.length,
                  //   ),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    homeres.homemodel?.nextAccutionTime?.label??"",
                    style: getSemiBoldStyle(color: Colors.black,fontSize:17),
                  ),
                  SizedBox(height: 16,),
                  TimerScreen(),
                   const SizedBox(
                    height:25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'LATEST\t',
                          style: getSemiBoldStyle(
                              color: Colormanager.textColor, fontSize: 16),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' ARRIVALS',
                              style: getSemiBoldStyle(
                                  color: Colormanager.primary, fontSize: 16),
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
                      ),
                    ],
                  ),
                   const SizedBox(
                    height:26,
                  ),
                  SizedBox(
                    height: size.height * .28,
                    width: size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top:5, right: 20),
                          child: InkWell(
                            onTap: () {
                              inputlatestarrivals(index);

     
                            },
                            child: Container(
                              height: size.height*.25,
                              width: size.width/2,
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
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(homeres.homemodel?.saleVehicles?[index].vehicleName??"",
                                            style: getSemiBoldStyle(
                                                color: Colors.black)),
                                        Container(
                                          width: 40,
                                          height: 15,
                                          decoration: BoxDecoration(
                                              color: Colormanager.primary,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Center(
                                            child: Text(
                                              "Bid Now",
                                              style: getRegularStyle(
                                                  color: Colormanager.white,
                                                  fontSize: 7),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height:8,
                                    ),
                                    Row(
                                      children: [
                                        Text(homeres.homemodel?.saleVehicles?[index].price.toString()??"",
                                            style: getMediumtStyle(
                                                color: Colors.black,
                                                fontSize: 10)),
                                      ],
                                    ),
                                    const SizedBox(
                                      height:20,
                                    ),
                                    SizedBox(
                                      width: size.width/1.2,
                                      height:90,
                                      child: Image.network("$endpoint ${homeres.homemodel?.saleVehicles?[index].image}")
                                    ),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                            width:22,
                                            height:18,
                                            child: Image.asset(
                                                'assets/petrol.png')),
                                        Text(homeres.homemodel?.saleVehicles?[index].fueltype ??"",
                                            style: getMediumtStyle(
                                                color: Colormanager.textColor,
                                                fontSize: 12)),
                                        Text(homeres.homemodel?.saleVehicles?[index].gearshift??"",
                                            style: getMediumtStyle(
                                                color: Colormanager.textColor,
                                                fontSize: 10)),
                                      ],
                                    ),
                                    const SizedBox(
                                      height:5,
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
                          ));
                      },
                      itemCount:homeres.homemodel?.saleVehicles?.length,
                    ),
                  ),
                  const SizedBox(
                    height:25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'BUY\t',
                          style: getSemiBoldStyle(
                              color: Colormanager.textColor, fontSize: 16),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' NOW',
                              style: getSemiBoldStyle(
                                  color: Colormanager.primary, fontSize: 16),
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
                      ),
                    ],
                  ),
                   const SizedBox(
                    height:26,
                  ),
                  SizedBox(
                    height: size.height * .28,
                    width: size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top:5, right: 20),
                          child: Container(
                            height: size.height*.25,
                            width: size.width/2,
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
                              padding: const EdgeInsets.all(8.0),
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
                                      Container(
                                        width: 40,
                                        height: 15,
                                        decoration: BoxDecoration(
                                            color: Colormanager.primary,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Center(
                                          child: Text(
                                            "Bid Now",
                                            style: getRegularStyle(
                                                color: Colormanager.white,
                                                fontSize: 7),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height:8,
                                  ),
                                  Row(
                                    children: [
                                      Text("RS 4.64 - 5.99 Lakh",
                                          style: getMediumtStyle(
                                              color: Colors.black,
                                              fontSize: 10)),
                                    ],
                                  ),
                                  const SizedBox(
                                    height:20,
                                  ),
                                  SizedBox(
                                    width: size.width/1.2,
                                    height:90,
                                    child: Image.asset('assets/carr.jpeg')
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                          width:22,
                                          height:18,
                                          child: Image.asset(
                                              'assets/petrol.png')),
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
                                    height:5,
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
                          ));
                      },
                      itemCount: 10,
                    ),
                  ),
                  const SizedBox(
                    height:25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'BID\t',
                          style: getSemiBoldStyle(
                              color: Colormanager.textColor, fontSize: 16),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' NOW',
                              style: getSemiBoldStyle(
                                  color: Colormanager.primary, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(FadePageRoute(page:MyBidList()));
                        },
                        child: Container(
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
                        ),
                      ),
                    ],
                  ),
                   const SizedBox(
                    height:26,
                  ),
                  SizedBox(
                    height: size.height *.36,
                    width: size.width,
                    child: ListView.builder(

                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        
                        return Padding(
                          padding: const EdgeInsets.only(
                              top:9,right: 20),
                          child:  InkWell(
                            onTap: () {
                              
                              inputbidnow(index);
                             
                            },
                            child: Container(
                              height:size.height,
                              width:size.width/1.8,
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
                                    padding: const EdgeInsets.only(top:8.0,left:3.0,right:3.0),
                                    child: Column(
                                      
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(homeres.homemodel?.bidVehicles?[index].vehicleName??"",
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
                                            Text("₹\t"),
                                            Text(homeres.homemodel?.saleVehicles?[index].price?.toString()??"",
                                                style: getMediumtStyle(
                                                    color: Colors.black, fontSize: 12)),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          width: size.width,
                                          height:50,
                                          child: Image.network(
                                            width: 40,
                                            
                                               "$endpoint${homeres.homemodel?.bidVehicles?[index].image}",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                                width:30,
                                                height:50,
                                                child:
                                                    Image.asset('assets/petrol.png')),
                                            Text(homeres.homemodel?.saleVehicles?[index].fueltype??" "  "\t\t\t",
                                                style: getMediumtStyle(
                                                    color: Colormanager.textColor,
                                                    fontSize: 10)),
                                            Text(homeres.homemodel?.saleVehicles?[index].gearshift??"",
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
                                  SizedBox(height:10,),
                                    Container(
                                      height:69,
                                      width:size.width,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 255, 254, 254),
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight:Radius.circular(15) )
                              
                                      ),
                                      // child:AttendanceScreen(),
                                    )
                                ],
                              ),
                            ),
                          ));
                      },
                      itemCount:homeres.homemodel?.bidVehicles?.length,
                    ),
                  ),
                 
                  SizedBox(height:50,),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text("World Largest",style: getRegularStyle(color:Colormanager.black,fontSize:23),),
                          SizedBox(width: 6,),
                          Text("Automotive",style: getRegularStyle(color: Colormanager.primary,fontSize:23),)
                        ],
                      ),
                      SizedBox(height: 10,),
                      
                      Row(
                        children: [
                          
                          Text("Marketplace",style: getRegularStyle(color: Colormanager.black,fontSize:23),),
                        ],
                      ),
                      SizedBox(height:20,),
                      Row(
                        children: [
                          Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                            color: Colors.amber,
                            image: DecorationImage(image: 
                            AssetImage('assets/carr.jpeg',),fit: BoxFit.cover)
                            ),),
                            SizedBox(width:8,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Pre-Owned vehicle",style: getSemiBoldStyle(color:Colormanager.black,fontSize:14),),
                                SizedBox(height: 6,),
                                Text("Sale and purchase",style: getSemiBoldStyle(color:Colormanager.black,fontSize:14),),
                                SizedBox(height: 8,),
                                Text("Browse through the new and pre-owned\nvehicles which has been recently added\n to our collection",
                               style: getRegularStyle(color:Colormanager.greyText,fontSize:10), ),
                               SizedBox(height:10,),
                               InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context,Routes.searchs);
                                },
                                 child: Row(
                                  children: [
                                    Text("Discover",style: getSemiBoldStyle(color:Colormanager.primary,fontSize:20),),
                                    SizedBox(width:8,),
                                   Image.asset('assets/slide_layer.png',height: 18,),
                                  ],
                                 ),
                               )
                              ],
                            )
                        ],
                      ),
                      SizedBox(height:15,),
                      Padding(
                        padding: const EdgeInsets.only(top:14.0,bottom:20),
                        child: Stack(
                          
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top:30.0),
                              child: Container(
                                height:80,
                                width: 205,
                               
                                decoration: BoxDecoration(
                                   color: Colormanager.white,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius:10,
                                      blurStyle: BlurStyle.outer,
                                      spreadRadius:1.5,
                                      color: Colormanager.greyText.withOpacity(0.2)
                                    )
                                  ]
                                ),
                                child: Center(child: Padding(
                                  padding: const EdgeInsets.only(top:11.0),
                                  child: Text("Feel free to connect with us",style:getSemiBoldStyle(color:Colormanager.black,fontSize:13),),
                                )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:70.0,),
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration:BoxDecoration(
                                  color: Colormanager.primary,
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius:10,
                                      color: Colormanager.greyText,
                                      spreadRadius: 1.7
                                    )
                                  ]
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset('assets/contactus.png',color: Colormanager.white,height: 14,),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

// final List<String> imgList = [
//   'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
//   'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
//   'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
//   'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
//   'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
//   'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
// ];

// final List<Widget> imageSliders = imgList
//     .map((item) => Container(
//           child: Container(
//             margin: const EdgeInsets.all(5.0),
//             child: ClipRRect(
//                 borderRadius: const BorderRadius.all(Radius.circular(5.0)),
//                 child: Stack(
//                   children: <Widget>[
//                     Image.network(item, fit: BoxFit.cover, width: 1000.0),
//                     Positioned(
//                       bottom: 0.0,
//                       left: 0.0,
//                       right: 0.0,
//                       child: Container(
//                         decoration: const BoxDecoration(
//                           gradient: LinearGradient(
//                             colors: [
//                               Color.fromARGB(200, 0, 0, 0),
//                               Color.fromARGB(0, 0, 0, 0)
//                             ],
//                             begin: Alignment.bottomCenter,
//                             end: Alignment.topCenter,
//                           ),
//                         ),
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 10.0, horizontal: 20.0),
//                         child: Text(
//                           'No. ${imgList.indexOf(item)} image',
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 20.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 )),
//           ),
//         ))
//     .toList();
