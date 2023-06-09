

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/presentation/widgets/bottom_nav.dart';


import 'package:otodeals/presentation/widgets/timer2.dart';

class Porductdetails extends StatefulWidget {
const Porductdetails({super.key});

@override
State<Porductdetails> createState() => _PorductdetailsState();
    }

    class _PorductdetailsState extends State<Porductdetails> {
       bool showSecondContainer = false;
       bool isExpanded = false;

  void toggleContainer() {
    setState(() {
      showSecondContainer = !showSecondContainer;
    });
  }
    
  
  
     
      @override
        Widget build(BuildContext context) {
        return Scaffold(
        body:
        SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.only(top:26),
        child: Column(
        children: [
        Stack(
        children:[ Container(
        height: 250,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
        color: Colormanager.primary,
        borderRadius:
        BorderRadius.only(topLeft:Radius.circular(30),topRight:Radius.circular(30),bottomLeft:Radius.circular(60),bottomRight:
        Radius.circular(60) )

        ),
        child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Padding(
        padding: const EdgeInsets.only(top:40.0,left:30),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text("HYUNDAI",style: getSemiBoldStyle(color: Colormanager.white,fontSize:20),),
        SizedBox(height:10,),
        Text("\$56.7",style: getBoldStyle(color: Colormanager.white,fontSize: 20),)
        ],
        ),
        ),
        Padding(
        padding: const EdgeInsets.only(left:180.0,top:45),
        child: Container(
        height:35,
        width: 35,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),

        boxShadow:[
        BoxShadow(
        blurRadius:5,
        color:Colormanager.white,
        spreadRadius:0,
        offset: Offset(0,4))],
        color: Colormanager.white
        ),
        child:Icon(Icons.favorite,color: Colormanager.primary,)),
        )

        ],
        ),
        ),
        Padding(
        padding: const EdgeInsets.only(top:150.0,left:35),
        child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width/1.2,

        decoration: BoxDecoration(
        color:Colormanager.white,
        borderRadius:
        BorderRadius.only(topLeft:Radius.circular(50),topRight:Radius.circular(50),bottomLeft:Radius.circular(20),bottomRight:Radius.circular(20)),
        boxShadow: [
        BoxShadow(
        blurRadius:4,
        color: Color.fromARGB(255, 147, 146, 146)

        )
        ]
        ),
        child: Column(
        children: [
        Padding(
        padding: const EdgeInsets.only(top:80),
        child: Container(
        height: 27,
        width: 67,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.amber,
        ),
        child: Padding(
        padding: const EdgeInsets.only(left:10.0),
        child: Row(
        children: [
        Icon(Icons.star,color: Colors.white,size:18,),
        Text("4.5",style: getSemiBoldStyle(color:Colormanager.white,fontSize:15),)
        ],
        ),
        ),
        ),
        ),
        SizedBox(height:5,),
        Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
        children:[
        Padding(
        padding: const EdgeInsets.only(left:40.0),
        child: Container(
        height:70 ,
        width: 70,
        decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.circular(10)),
        child: Center(
        child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
        children: [
        Image.asset('assets/speedometer-icon.png',height:30,width:30,),
        SizedBox(
        height:6,
        ),

        Text("Automatic", style:getSemiBoldStyle(color:Colormanager.primary,fontSize:9),),
        ],
        ),
        ),
        ),
        ),
        ),
        Container(
        height:70 ,
        width: 70,
        decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.circular(10)),
        child: Center(
        child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
        children: [
        Image.asset('assets/car-seat-belt-icon.png',height:30,width:30,),
        SizedBox(
        height:6,
        ),

        Text("5 seats", style:getSemiBoldStyle(color:Colormanager.primary,fontSize:9),),
        ],
        ),
        ),
        ),
        ),
        Container(
        height:70 ,
        width: 70,
        decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.circular(10)),
        child: Center(
        child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
        children: [
        SvgPicture.asset('assets/drawer_icons/gasoline-pump-svgrepo-com.svg',height:30,width:30,),
        SizedBox(
        height:6,
        ),

        Text("diesel", style:getSemiBoldStyle(color:Colormanager.primary,fontSize:9),),
        ],
        ),
        ),
        ),
        ),
        ]),
        )

        ],
        ),


        ),
        ),
        Padding(
        padding: const EdgeInsets.only(top:10.0,left:50),
        child: Image.asset('assets/result.png',height:290,width:290,),
        ),
        ]),
        SizedBox(height:20,),
        Text("NEXT AUCTION CLOSES IN",style:getSemiBoldStyle(color:Colors.black,fontSize:16),),

        TimerScreen(),
        SizedBox(
        height: 15,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right:1.0,left:12,bottom:10),
              child: ExpansionTile(trailing: Container(height:0,width:0.2),
                title: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                color: Colormanager.primary,
                borderRadius: BorderRadius.circular(30)
                ),
                child: Center(child: Text("PLACE YOUR BID",style: getBoldStyle(color:Colormanager.white,fontSize:15),)),
                ),
               
                
              
                 children:   [
                  Padding(
                    padding: const EdgeInsets.only (top:10.0,left:2,right:14,bottom:20),
                    child: Container(
                            height: 230,
                            width: MediaQuery.of(context).size.width/1.3,
                            
                            decoration: BoxDecoration(
                              color:const Color.fromARGB(255, 239, 239, 239),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow:[BoxShadow(
                                blurRadius:6,
                                color: Color.fromARGB(255, 174, 174, 174),
                                blurStyle: BlurStyle.normal
                              )] ,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top:25.0,),
                              child: Column(
                                children: [
                                  Text("ENTER YOUR BID AMOUNT:",
                                  style: getBoldStyle(color: const Color.fromARGB(255, 37, 37, 37),fontSize:14),),
                                  SizedBox(height: 10,),
                                  Text("Bid amount must be greater than 1 lack",
                                  style: getMediumtStyle(color:Colormanager.greyText,fontSize:12),),
                                  SizedBox(height: 20,),
                                  Padding(
                                    padding: const EdgeInsets.only(left:23.0,right: 23),
                                    child: TextField(
                                      
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colormanager.background,
                                        hintText:'2000000',
                                        hintStyle:getSemiBoldStyle(fontSize:14,color: const Color.fromARGB(255, 14, 14, 14)) ,
                                        enabledBorder:
                                         OutlineInputBorder(borderSide:
                                         BorderSide(width:2,color:Color.fromARGB(255, 202, 200, 200))),
                                        
                                      ),
                                    ),
                                  ),
                                  SizedBox(height:28,),
                                  Container(
                                    height: 40,
                              width: MediaQuery.of(context).size.width/1.2,
                              decoration: BoxDecoration(
                                 color: Colormanager.primary,
                                 borderRadius: BorderRadius.circular(20)
                          
                              ),
                             
                             child:Center(child: Text("PLACE YOUR BID",style: getSemiBoldStyle(color:Colormanager.white,fontSize:15),)),
                              
                                  )
                                ],
                              ),
                            ),
                                    
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height:4,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height:isExpanded ? MediaQuery.of(context).size.height*1.2:300,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 238, 238, 238),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: const Color.fromARGB(255, 184, 185, 198)
                )
              ]
                
            ),
            child: Padding(
                padding: EdgeInsets.only(top:36.0,right: 6,left:6 ),
                child: GestureDetector(
          onTap:(){
            setState(() {
              isExpanded=!isExpanded;
            });
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  elevation:10,
                  shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
                  child: ExpansionTile(
                      trailing: Container(
                         height:37,
                                       width: 37,
                                       decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(20),
                               
                                       boxShadow:[
                                       BoxShadow(
                                       blurRadius:5,
                                       color:const Color.fromARGB(255, 198, 197, 197),
                                       spreadRadius:0,
                                       offset: Offset(0,4))],
                                       color: Colormanager.white
                                       ),
                        child: Transform.rotate(
                          angle:  3.14159 * 1.5,
                          child: Icon(Icons.arrow_back_ios,size: 16,color: Colormanager.primary,)),
                      ),
                    title: Container(
                      child: Text("Overview",style: getSemiBoldStyle(color:Colormanager.black,fontSize:22),),
                      ),
                    
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          color: Colormanager.background,
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child:Column(
                             children:[
                              Row(
                                children: [
                                  Image.asset('assets/NicePng_production-png_8007006.png',color: Colormanager.primary,height:25,width:25,),
                                  SizedBox(width:10,),
                                  Text(
                                    "Registeration",
                                    style:getMediumtStyle(
                                      fontSize:13.0,
                                      color: const Color.fromARGB(255, 0, 0, 0)
                                    ),
                                  ),
                                  SizedBox(width: 90,),
                                  Text("OCT-2020",style: getBoldStyle(color: Colors.black),)
                                  
                                ],
                              ),
                              SizedBox(height: 10.0),
                              Container(
                                    height:0.8,
                                    width: MediaQuery.of(context).size.width,
                                    color: Color.fromARGB(255, 158, 155, 155),
                                  ),
                                  SizedBox(height:20,),
                              
                            Row(
                              children: [
                                Image.asset('assets/car-document-icon.png',color: Colormanager.primary,height: 20,),
                                SizedBox(width: 10,),
                                Text("Manufacturing Year",
                                style: getMediumtStyle(
                                  color:const Color.fromARGB(255, 0, 0, 0),
                                  fontSize:13),),
                                  SizedBox(width: 50,),
                                  Text("OCT-2020",style: getBoldStyle(color: Colors.black),)
                              ],
                            ),
                            SizedBox(height:10,),
                             Container(
                                    height:0.8,
                                    width: MediaQuery.of(context).size.width,
                                    color: Color.fromARGB(255, 158, 155, 155),
                                  ),
                      
                            SizedBox(height: 20,),
                            Row(
                              children: [
                                Image.asset('assets/car_performance-512.png',color: Colormanager.primary,height:28,),
                                SizedBox(width:10,),
                                Text("Odometer",style: getMediumtStyle(
                                  color:const Color.fromARGB(255, 0, 0, 0),
                                  fontSize:13),),
                                  SizedBox(width:110 ,),
                                  Text("23,040km",style: getBoldStyle(color: Colors.black),)
                              ],
                            ),
                            SizedBox(height: 10,),
                              Container(
                                    height:0.8,
                                    width: MediaQuery.of(context).size.width,
                                    color: Color.fromARGB(255, 158, 155, 155),
                                  ),
                      
                            SizedBox(height: 20,),
                            Row(
                              children: [
                                Image.asset('assets/automatic-transmission.png',color: Colormanager.primary,height: 30,),
                                SizedBox(width:10,),
                                Text("Transmission",style: getMediumtStyle(
                                  color:const Color.fromARGB(255, 0, 0, 0),
                                  fontSize:13),),
                                  SizedBox(width:100 ,),
                                  Text("Manual",style: getBoldStyle(color: Colors.black),)
                              ],
                            ),
                             SizedBox(height: 20,),
                              Container(
                                    height:0.8,
                                    width: MediaQuery.of(context).size.width,
                                    color: Color.fromARGB(255, 163, 163, 163),
                                  ),
                                  SizedBox(height:20,),
                      
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left:70.0),
                                      
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("View More Details",style: getMediumtStyle(color:Colormanager.primary,fontSize:14),),
                                          SizedBox(width: 10,),
                                          Transform.rotate(
                                            angle:3.14159 * 1.5 ,
                                            child: Icon(Icons.arrow_back_ios,size:15,color: Colormanager.primary,)),
                                        ],
                                      ),
                                    ),
                                  )
                      
                      
                            
                          ]
                          )
                        ),
                      ),
                      
                    ],
                    
                  ),
                ),
                SizedBox(height: 16.0),
               Card(
                  elevation:10,
                  shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
                  child: ExpansionTile(
                      trailing: Container(
                         height:37,
                                       width: 37,
                                       decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(20),
                               
                                       boxShadow:[
                                       BoxShadow(
                                       blurRadius:5,
                                       color:const Color.fromARGB(255, 198, 197, 197),
                                       spreadRadius:0,
                                       offset: Offset(0,4))],
                                       color: Colormanager.white
                                       ),
                        child: Transform.rotate(
                          angle:  3.14159 * 1.5,
                          child: Icon(Icons.arrow_back_ios,size: 16,color: Colormanager.primary,)),
                      ),
                    title: Container(
                      child: Text("Gallery",style: getSemiBoldStyle(color:Colormanager.black,fontSize:22),),
                      ),
                    
                    children: [
                      Container(
                        color: Colormanager.background,
                      height: 120,
                      width: MediaQuery.of(context).size.width,
                       child: ListView.builder(
                        itemCount: 6,
                        scrollDirection:Axis.horizontal,
                        itemBuilder: (context, index) {
                          
                        
                         return Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Container(
                            height:60,
                            width: 90,
                            decoration: BoxDecoration(
                              color:Colors.white,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child:Image.asset('assets/cars.jpg') ,
                           ),
                         );
            }),
                     ),
                      
                    ],
                    
                  ),
                ),
                SizedBox(height: 16,),
                 Card(
                  elevation:10,
                  shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
                  child: ExpansionTile(
                      trailing: Container(
                         height:37,
                                       width: 37,
                                       decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(20),
                               
                                       boxShadow:[
                                       BoxShadow(
                                       blurRadius:5,
                                       color:const Color.fromARGB(255, 198, 197, 197),
                                       spreadRadius:0,
                                       offset: Offset(0,4))],
                                       color: Colormanager.white
                                       ),
                        child: Transform.rotate(
                          angle:  3.14159 * 1.5,
                          child: Icon(Icons.arrow_back_ios,size: 16,color: Colormanager.primary,)),
                      ),
                    title: Container(
                      child: Text("Description",style: getSemiBoldStyle(color:Colormanager.black,fontSize:22),),
                      ),
                    
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child:Column(
                             children:[
                              Row(
                                children: [
                                  Container(
                                     height:24,
                                       width:24,
                                       decoration: BoxDecoration(
                                        
                                       borderRadius: BorderRadius.circular(20),
                               
                                       boxShadow:[
                                       BoxShadow(
                                       blurRadius:5,
                                       color:const Color.fromARGB(255, 198, 197, 197),
                                       spreadRadius:0,
                                       offset: Offset(0,4))],
                                       color:Color.fromARGB(255, 246, 154, 160)
                                       ),
                                    child: Icon(Icons.check_sharp,size: 17,color: Colormanager.primary,)),
                                  SizedBox(width:10,),
                                  Text(
                                    "Air-conditioning",
                                    style:getMediumtStyle(
                                      fontSize:13.0,
                                      color: const Color.fromARGB(255, 0, 0, 0)
                                    ),
                                  ),
                                  
                                ],
                              ),
                              SizedBox(height: 10.0),
                              Container(
                                    height:0.8,
                                    width: MediaQuery.of(context).size.width,
                                    color: Color.fromARGB(255, 158, 155, 155),
                                  ),
                                  SizedBox(height:20,),
                              
                            Row(
                              children: [
                               Container(
                                     height:24,
                                       width:24,
                                       decoration: BoxDecoration(
                                        
                                       borderRadius: BorderRadius.circular(20),
                               
                                       boxShadow:[
                                       BoxShadow(
                                       blurRadius:5,
                                       color:const Color.fromARGB(255, 198, 197, 197),
                                       spreadRadius:0,
                                       offset: Offset(0,4))],
                                       color:Color.fromARGB(255, 246, 154, 160)
                                       ),
                                    child: Icon(Icons.check_sharp,size: 17,color: Colormanager.primary,)),
                                SizedBox(width: 10,),
                                Text("Engine & Transmission",
                                style: getMediumtStyle(
                                  color:const Color.fromARGB(255, 0, 0, 0),
                                  fontSize:13),),
                                 
                              ],
                            ),
                            SizedBox(height:10,),
                             Container(
                                    height:0.8,
                                    width: MediaQuery.of(context).size.width,
                                    color: Color.fromARGB(255, 158, 155, 155),
                                  ),
                      
                            SizedBox(height: 20,),
                            Row(
                              children: [
                              Container(
                                     height:24,
                                       width:24,
                                       decoration: BoxDecoration(
                                        
                                       borderRadius: BorderRadius.circular(20),
                               
                                       boxShadow:[
                                       BoxShadow(
                                       blurRadius:5,
                                       color:const Color.fromARGB(255, 198, 197, 197),
                                       spreadRadius:0,
                                       offset: Offset(0,4))],
                                       color:Color.fromARGB(255, 246, 154, 160)
                                       ),
                                    child: Icon(Icons.check_sharp,size: 17,color: Colormanager.primary,)),
                                SizedBox(width:10,),
                                Text("Electricals & Interior",style: getMediumtStyle(
                                  color:const Color.fromARGB(255, 0, 0, 0),
                                  fontSize:13),),
                                  
                              ],
                            ),
                            SizedBox(height: 10,),
                              Container(
                                    height:0.8,
                                    width: MediaQuery.of(context).size.width,
                                    color: Color.fromARGB(255, 158, 155, 155),
                                  ),
                      
                                  SizedBox(height:20,),
                      
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left:70.0),
                                      
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom:8.0),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("View More Details",style: getMediumtStyle(color:Colormanager.primary,fontSize:14),),
                                            SizedBox(width: 10,),
                                            Transform.rotate(
                                              angle:3.14159 * 1.5 ,
                                              child: Icon(Icons.arrow_back_ios,size:15,color: Colormanager.primary,)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                      
                      
                            
                          ]
                          )
                        ),
                      ),
                      
                    ],
                    
                  ),
                ),
              ],
            ),
          ),
                ),
              ),
            ),
            )]))),
            bottomNavigationBar:const BottomNavigationWidget(),
            );
             
         
        }
    }
   