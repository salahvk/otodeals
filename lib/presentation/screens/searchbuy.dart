
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:otodeals/core/color_manager.dart';
// import 'package:otodeals/core/styles_manager.dart';
// import 'package:otodeals/presentation/widgets/bottom_nav.dart';



// class Buysearch extends StatefulWidget {
//   const Buysearch({super.key});

//   @override
//   State<Buysearch> createState() => _BuysearchState();
// }

// class _BuysearchState extends State<Buysearch> {
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: SafeArea(
//         child:SingleChildScrollView(
//           child:Column(
//             children: [
//                Padding(
//                 padding: const EdgeInsets.fromLTRB(20,40, 20, 0),
//                 child: GridView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     gridDelegate:
//                         const SliverGridDelegateWithMaxCrossAxisExtent(
//                             maxCrossAxisExtent:300,
//                             childAspectRatio: 3 / 3,
//                             crossAxisSpacing:16,
//                             mainAxisExtent:220,
//                             mainAxisSpacing: 20),
//                     itemCount: 10,
//                     itemBuilder: (BuildContext ctx, index) {
//                       return InkWell(
//                         onTap: () {
//                           // Navigator.push(context,
//                           //     MaterialPageRoute(builder: (ctx) {
//                           //   return const LoadingListPage();
//                           // }));
//                           // final id = homeData![index].id;
//                           // servicerProvider.serviceId = id;
//                           // getSubService(context, id);
//                         },
//                         child: Container(
//                           height:200,
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                               boxShadow: [
//                                 BoxShadow(
//                                   blurRadius: 10.0,
//                                   color: Colors.grey.shade300,
//                                   offset: const Offset(2, 2.5),
//                                 ),
//                               ],
//                               color: Colormanager.white,
//                               borderRadius: BorderRadius.circular(20)),
//                           child: Column(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(top:10.0,left:10.0,right:10.0),
//                                 child: Column(
                                  
//                                   // mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Text("HYUNDAI",
//                                             style: getSemiBoldStyle(
//                                                 color: Colors.black)),
//                                         // Container(
//                                         //   width: 40,
//                                         //   height: 15,
//                                         //   decoration: BoxDecoration(
//                                         //       color: Colormanager.primary,
//                                         //       borderRadius:
//                                         //           BorderRadius.circular(15)),
//                                         //   child: Center(
//                                         //     child: Text(
//                                         //       "Bid Now",
//                                         //       style: getRegularStyle(
//                                         //           color: Colormanager.white,
//                                         //           fontSize: 7),
//                                         //     ),
//                                         //   ),
//                                         // )
//                                       ],
//                                     ),
//                                     const SizedBox(
//                                       height: 5,
//                                     ),
//                                     Row(
//                                       children: [
//                                         Text("RS 4.64 - 5.99 Lakh",
//                                             style: getMediumtStyle(
//                                                 color: Colors.black, fontSize: 10)),
//                                       ],
//                                     ),
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                     SizedBox(
//                                       width: size.width,
//                                       height: 110,
//                                       child: CachedNetworkImage(
//                                         width: 60,
//                                         imageUrl:
//                                             "https://wallpapercave.com/wp/wp2060860.jpg",
//                                         fit: BoxFit.cover,
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 15,
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         SizedBox(
//                                             width: 30,
//                                             height:20,
//                                             child:
//                                                 Image.asset('assets/petrol.png')),
//                                         Text("PETROL",
//                                             style: getMediumtStyle(
//                                                 color: Colormanager.textColor,
//                                                 fontSize: 10)),
//                                         Text("35667 KM",
//                                             style: getMediumtStyle(
//                                                 color: Colormanager.textColor,
//                                                 fontSize: 10)),
//                                       ],
                                    
                                   
//                                     // Text(homeData![index].service ?? '',
//                                     //     textAlign: TextAlign.center,
//                                     //     style: getRegularStyle(
//                                     //         color: Colormanager.primary,
//                                     //         fontSize:
//                                     //            10
//                                     ),
                                
                              
//                                 ],
//                                 ),
//                               ),
                           
//             ])));
//   }))],
//                           ),
//                         ),
//                       ),
//                       bottomNavigationBar: BottomNavigationWidget(),);
//                     }
    
//   }
