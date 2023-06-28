import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/presentation/widgets/bottom_nav.dart';

class Sellingpage extends StatefulWidget {
  const Sellingpage({super.key});

  @override
  State<Sellingpage> createState() => _SellingpageState();
}

class _SellingpageState extends State<Sellingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:[Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height/3,
                width: MediaQuery.of(context).size.width,
                
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Image.asset('assets/carr.jpeg',fit: BoxFit.cover,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children:[Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width/1.3,
                  
                  decoration: BoxDecoration(
                    color:const Color.fromARGB(255, 239, 239, 239),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow:const [BoxShadow(
                      blurRadius:6,
                      color: Color.fromARGB(255, 174, 174, 174),
                      blurStyle: BlurStyle.normal
                    )] ,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top:25.0,),
                    child: Column(
                      children: [
                        Text("ENTER YOUR CAR NUMBER",
                        style: getBoldStyle(color: const Color.fromARGB(255, 37, 37, 37),fontSize:14),),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(left:23.0,right: 23),
                          child: TextField(
                            
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colormanager.background,
                              hintText:'Eg:DL11AD3345',
                              hintStyle:getSemiBoldStyle(fontSize:14,color: Colormanager.greyText) ,
                              enabledBorder:
                               OutlineInputBorder(borderSide:
                               BorderSide(width:2,color:Color.fromARGB(255, 202, 200, 200))),
                              
                            ),
                          ),
                        ),
                        SizedBox(height:48,),
                        Container(
                          height: 40,
                    width: MediaQuery.of(context).size.width*2,
                    decoration: BoxDecoration(
                       color: Colormanager.primary,
                       borderRadius: BorderRadius.circular(20)
                
                    ),
                   
                   child:Center(child: Text("GET A CAR PRICE",style: getSemiBoldStyle(color:Colormanager.white,fontSize:15),)),
                    
                        )
                      ],
                    ),
                  ),
                          
                ),
          ]),
            ),
            SizedBox(height: 5,),
            Container(
              height:MediaQuery.of(context).size.height*1.3,
              width: MediaQuery.of(context).size.width/1.10,
             
              decoration: BoxDecoration(
                 color: const Color.fromARGB(255, 238, 238, 238),
                 borderRadius: BorderRadius.circular(20)

              ),
              child: Column(
                children: [
                 Padding(
                   padding: const EdgeInsets.only(top:30.0,left:15),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Or Start With Your Car Brand",style:getSemiBoldStyle(color:Colormanager.black,fontSize:14),),
                       Padding(
                         padding: const EdgeInsets.only(right:17.0),
                         child: Container(
                                    height: 27,
                                    width: 27,
                                    
                                    decoration: BoxDecoration(
                                      color:Colormanager.background,
                                      borderRadius: BorderRadius.circular(14)
                                    ),
                                    child: Icon(Icons.arrow_forward_ios_rounded,size:15,color:Colormanager.primary),),
                       ),
                    ],
                   ),
                 ) ,
                 SizedBox(height: 20,),
                 Padding(padding: EdgeInsets.only(left: 5)),
                 SizedBox(
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
                          color:Colormanager.white,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child:Image.asset('assets/hondalogo.png') ,
                       ),
                     );
  }),
                 ),
                   SizedBox(height:37,),
            Text("SELL IN 4 EASY STEPS",style:getSemiBoldStyle(color:Colors.black,fontSize:15),),
            SizedBox(height:35,),
            Container(
              height:130,
              width:MediaQuery.of(context).size.width/1.3,
             
              decoration: BoxDecoration(
                 color:Colormanager.primary,
                 borderRadius: BorderRadius.circular(30),

              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:50,left:20),
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                             height:35,
                                width:35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  
                                  color: Colormanager.white
                                ),
                                child:Image.asset("assets/pngkit_subscribe-button-png_49494.png",color: Colormanager.primary,height:1,width:1,fit: BoxFit.contain,)),
                            )
                          ],
                  
                          ),
                  ),
                  SizedBox(width:20,),
                  Padding(
                    padding: const EdgeInsets.only(top:30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Get price online",style: getMediumtStyle(color:Colormanager.white,fontSize:14),),
                        SizedBox(height: 10,),
                        Text("You submit information",style: getMediumtStyle(color: Colormanager.white,fontSize:13),),
                        SizedBox(height: 10,),
                        Text("about your vehicle",style: getMediumtStyle(color: Colormanager.white,fontSize:13),)
                      ],
                    ),
                  )
                ])
              ),
              SizedBox(height:30,),
               Container(
              height:130,
              width:MediaQuery.of(context).size.width/1.3,
             
              decoration: BoxDecoration(
                 color:Colormanager.white,
                 borderRadius: BorderRadius.circular(30),

              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:50,left:20),
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                             height:35,
                                width:35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  
                                  color: Colormanager.white
                                ),
                                child:Image.asset('assets/addpic.png',color: Colormanager.primary,)),
                            )
                          ],
                  
                          ),
                  ),
                  SizedBox(width:20,),
                  Padding(
                    padding: const EdgeInsets.only(top:30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Car Inspectation",style: getMediumtStyle(color:Color.fromARGB(255, 22, 22, 22),fontSize:14),),
                        SizedBox(height: 10,),
                        Text("if accepted,we'll ask you",style: getMediumtStyle(color: Colormanager.textColor,fontSize:13),),
                        SizedBox(height: 10,),
                        Text("for more information.",style: getMediumtStyle(color: Colormanager.textColor,fontSize:13),)
                      ],
                    ),
                  )
                ])
              ),
              SizedBox(height:30,),
               Container(
              height:130,
              width:MediaQuery.of(context).size.width/1.3,
             
              decoration: BoxDecoration(
                 color:Colormanager.white,
                 borderRadius: BorderRadius.circular(30),

              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:50,left:20),
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                             height:28,
                                width:28,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  
                                  color: Colormanager.white
                                ),
                                child:Image.asset('assets/confirmation.png',color: Colormanager.primary,height:5,width:5,)),
                            )
                          ],
                  
                          ),
                  ),
                  SizedBox(width:20,),
                  Padding(
                    padding: const EdgeInsets.only(top:30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Confirmation",style: getMediumtStyle(color:Color.fromARGB(255, 22, 22, 22),fontSize:14),),
                        SizedBox(height: 10,),
                        Text("we'll let you know if your",style: getMediumtStyle(color: Colormanager.textColor,fontSize:13),),
                        SizedBox(height: 10,),
                        Text("car is accepted.",style: getMediumtStyle(color: Colormanager.textColor,fontSize:13),)
                      ],
                    ),
                  )
                ])
              ),
              SizedBox(height:30,),
               Container(
              height:130,
              width:MediaQuery.of(context).size.width/1.3,
             
              decoration: BoxDecoration(
                 color:Colormanager.white,
                 borderRadius: BorderRadius.circular(30),

              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:50,left:20),
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                             height:36,
                                width:36,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  
                                  color: Colormanager.white
                                ),
                                child:Image.asset('assets/NicePng_handshake-png_297406.png',color: Color.fromARGB(255, 180, 15, 26),)),
                            )
                          ],
                  
                          ),
                  ),
                  SizedBox(width:20,),
                  Padding(
                    padding: const EdgeInsets.only(top:30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Car pickup& payment",style: getMediumtStyle(color:Color.fromARGB(255, 22, 22, 22),fontSize:14),),
                        SizedBox(height: 10,),
                        Text("connect you with high bidder",style: getMediumtStyle(color: Colormanager.textColor,fontSize:13),),
                        SizedBox(height: 10,),
                        Text("to complete the transactions.",style: getMediumtStyle(color: Colormanager.textColor,fontSize:13),)
                      ],
                    ),
                  )
                ])
              ),
              
              ],
              
                  )
        )],
              ),

            ]),
            bottomNavigationBar:const BottomNavigationWidget() ,
    );
    
              
  }
}