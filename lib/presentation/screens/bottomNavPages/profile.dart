import 'package:flutter/material.dart';
import 'package:otodeals/core/asset_manager.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/routes_manager.dart';
import 'package:otodeals/core/styles_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otodeals/presentation/screens/editprofile.dart';
import 'package:otodeals/presentation/screens/main_screen.dart';


class Myprofile extends StatefulWidget {
  const Myprofile({super.key});

  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colormanager.background,
      body: SingleChildScrollView(
        child:Column(
          children: [
            Container(
              height:50,
              width:MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                      Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => MainScreen()),
            );
                      },
                      child: 
                      Icon(Icons.arrow_back_ios,color: Colormanager.primary,
                      size:20,)),
                    SizedBox(width: 20,),
                    Text("Profile",style:getRegularStyle(
                      color:Colormanager.black,
                      fontSize:18
                    ) ,)
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 180,
                width: MediaQuery.of(context).size.width,
               
                decoration: BoxDecoration(
                  color: Colormanager.primary,
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(30),topRight: Radius.circular(30),bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:280.0,top:10),
                            child: Container(
                              height:27,
                              width: 27,
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
                              child:SvgPicture.asset("assets/drawer_icons/notify _bell_outlined.svg",color: Colormanager.primary,height:4,width:4,)),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:20.0,top: 2),
                                child: Container(
                                  height:69,
                                  width: 85,
                                  decoration: BoxDecoration(
                                    color:Colormanager.white,
                                    borderRadius: BorderRadius.circular(45),
                                   
                                    image:DecorationImage(image:AssetImage('assets/profileavatar.jpg',),fit: BoxFit.cover)
                                  ),
                                  
                                ),
                              )
                            ],
                          ),
                          
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Aysha",
                                style:getRegularStyle(
                                  fontSize:20,
                                  color: Colormanager.white
                                  
                
                                  
                                ),),
                                SizedBox(height: 8,),
                                Text("seludashabeer@gmail.com",
                                style: getMediumtStyle(color:Colormanager.white,
                                fontSize:13),),
                                SizedBox(height:10,),
                                InkWell(
                                  child: Container(
                                    height: 20,
                                    width: 100,
                                    
                                    decoration: BoxDecoration(
                                      color:Colormanager.primary,
                                      border: Border.all(color: Colormanager.white),
                                      borderRadius: BorderRadius.circular(9)
                                      
                                                
                                    ),
                                    child: Center(
                                      child: Text('Edit Profile',
                                      style:getMediumtStyle(color: Colormanager.white),),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(FadePageRoute(page:Editprofile()));
                                  },
                                )
                              ],
                            ),
                          )
                        ],
                      )
                            
                    ],
                  ),
                )
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 330,
              width: MediaQuery.of(context).size.width/1.2,
              decoration: BoxDecoration(
                color: Colormanager.background.withOpacity(0.8),
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    blurRadius:15,
                    color:Colormanager.greyText.withOpacity(0.9)
                  )
                ]
              ),
              child:Padding(
                padding: const EdgeInsets.only(top:30,left:20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/drawer_icons/person-8.svg',height:20,color: Color.fromARGB(255, 112, 112, 114),),
                        SizedBox(width:20,),
                        Column(
                          
                          children: [
                            Row(
                              
                              children: [
                                Text("My Profile",
                                style:getSemiBoldStyle(color: Color.fromARGB(255, 112, 112, 114) ),),
                                SizedBox(width:130,),
                                Container(
                                  height: 17,
                                  width: 17,
                                  
                                  decoration: BoxDecoration(
                                    color:Color.fromARGB(255, 206, 206, 206),
                                    borderRadius: BorderRadius.circular(9)
                                  ),
                                  child: Icon(Icons.arrow_forward_ios_rounded,size:12,color: const Color.fromARGB(255, 136, 136, 144),),),
                              ],
                            ),
                            SizedBox(height:8,),
                            Container(
                              height: 1.2,
                              width: MediaQuery.of(context).size.width/1.7,
                              color: Color.fromARGB(255, 197, 197, 199),
                            )
                          ],
                        )

                      ],
                    ),
                    SizedBox(height: 15,),
                    Row( children: [
                        Icon(Icons.favorite_outline_outlined,size:23,color: Color.fromARGB(255, 112, 112, 114),),
                        SizedBox(width:16,),
                        Column(
                          
                          children: [
                            Row(
                              
                              children: [
                                Text("My Bid List",
                                style:getSemiBoldStyle(color: Color.fromARGB(255, 112, 112, 114) ),),
                                SizedBox(width:128,),
                                Container(
                                  height: 17,
                                  width: 17,
                                  
                                  decoration: BoxDecoration(
                                    color:Color.fromARGB(255, 206, 206, 206),
                                    borderRadius: BorderRadius.circular(9)
                                  ),
                                  child: Icon(Icons.arrow_forward_ios_rounded,size:12,color: const Color.fromARGB(255, 136, 136, 144),),),
                              ],
                            ),
                            SizedBox(height:8,),
                            Container(
                              height: 1.2,
                              width: MediaQuery.of(context).size.width/1.7,
                              color: Color.fromARGB(255, 197, 197, 199),
                            )
                          ],
                        )

                      ],),
                      SizedBox(height: 15,),
                      Row(
                         children: [
                        SvgPicture.asset(AssetImages.menuicon,height:18,color: Color.fromARGB(255, 112, 112, 114),),
                        SizedBox(width:22,),
                        Column(
                          
                          children: [
                            Row(
                              
                              children: [
                                Text("Settings",
                                style:getSemiBoldStyle(color: Color.fromARGB(255, 112, 112, 114) ),),
                                SizedBox(width:140,),
                                Container(
                                  height: 17,
                                  width: 17,
                                  
                                  decoration: BoxDecoration(
                                    color:Color.fromARGB(255, 206, 206, 206),
                                    borderRadius: BorderRadius.circular(9)
                                  ),
                                  child: Icon(Icons.arrow_forward_ios_rounded,size:12,color: const Color.fromARGB(255, 136, 136, 144),),),
                              ],
                            ),
                            SizedBox(height:8,),
                            Container(
                              height: 1.2,
                              width: MediaQuery.of(context).size.width/1.7,
                              color: Color.fromARGB(255, 197, 197, 199),
                            )
                          ],
                        )

                      ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                         children: [
                        Image.asset(AssetImages.shoppingbag,height:20,color: Color.fromARGB(255, 112, 112, 114),),
                        SizedBox(width:20,),
                        Column(
                          
                          children: [
                            Row(
                              
                              children: [
                                Text("Cart",
                                style:getSemiBoldStyle(color: Color.fromARGB(255, 112, 112, 114,),fontSize:12),),
                                SizedBox(width:167,),
                                Container(
                                  height: 17,
                                  width: 17,
                                  
                                  decoration: BoxDecoration(
                                    color:Color.fromARGB(255, 206, 206, 206),
                                    borderRadius: BorderRadius.circular(9)
                                  ),
                                  child: Icon(Icons.arrow_forward_ios_rounded,size:12,color: const Color.fromARGB(255, 136, 136, 144),),),
                              ],
                            ),
                            SizedBox(height:8,),
                            Container(
                              height: 1.2,
                              width: MediaQuery.of(context).size.width/1.7,
                              color: Color.fromARGB(255, 197, 197, 199),
                            )
                          ],
                        )

                      ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                         children: [
                        Image.asset(AssetImages.closedlock,height:20,color: Color.fromARGB(255, 50, 50, 51),),
                        SizedBox(width:20,),
                        Column(
                          
                          children: [
                            Row(
                              
                              children: [
                                Text("Closed Auctions",
                                style:getSemiBoldStyle(color: Color.fromARGB(255, 112, 112, 114) ),),
                                SizedBox(width:94,),
                                Container(
                                  height: 17,
                                  width: 17,
                                  
                                  decoration: BoxDecoration(
                                    color:Color.fromARGB(255, 206, 206, 206),
                                    borderRadius: BorderRadius.circular(9)
                                  ),
                                  child: Icon(Icons.arrow_forward_ios_rounded,size:12,color: const Color.fromARGB(255, 136, 136, 144),),),
                              ],
                            ),
                            SizedBox(height:8,),
                            Container(
                              height: 1.2,
                              width: MediaQuery.of(context).size.width/1.7,
                              color: Color.fromARGB(255, 197, 197, 199),
                            )
                          ],
                        )

                      ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                         children: [
                        Image.asset(AssetImages.sellCarIcon,height:22,color: Color.fromARGB(255, 34, 34, 34),),
                        SizedBox(width:15,),
                        Column(
                          
                          children: [
                            Row(
                              
                              children: [
                                Text("My Cars",
                                style:getSemiBoldStyle(color: Color.fromARGB(255, 112, 112, 114) ),),
                                SizedBox(width:140,),
                                Container(
                                  height: 17,
                                  width: 17,
                                  
                                  decoration: BoxDecoration(
                                    color:Color.fromARGB(255, 206, 206, 206),
                                    borderRadius: BorderRadius.circular(9)
                                  ),
                                  child: Icon(Icons.arrow_forward_ios_rounded,size:12,color: const Color.fromARGB(255, 136, 136, 144),),),
                              ],
                            ),
                            SizedBox(height:8,),
                            Container(
                              height: 1.2,
                              width: MediaQuery.of(context).size.width/1.7,
                              color: Color.fromARGB(255, 197, 197, 199),
                            )
                          ],
                        )

                      ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                         children: [
                        Icon(Icons.lock_outline,color: Color.fromARGB(255, 112, 112, 114),),
                        SizedBox(width:17,),
                        Column(
                          
                          children: [
                            Row(
                              
                              children: [
                                Text("Change Password",
                                style:getSemiBoldStyle(color: Color.fromARGB(255, 112, 112, 114) ),),
                                SizedBox(width:82,),
                                Container(
                                  height: 17,
                                  width: 17,
                                  
                                  decoration: BoxDecoration(
                                    color:Color.fromARGB(255, 206, 206, 206),
                                    borderRadius: BorderRadius.circular(9)
                                  ),
                                  child: Icon(Icons.arrow_forward_ios_rounded,size:12,color: const Color.fromARGB(255, 136, 136, 144),),),
                              ],
                            ),
                            SizedBox(height:8,),
                            Container(
                              height: 1.2,
                              width: MediaQuery.of(context).size.width/1.7,
                              color: Color.fromARGB(255, 197, 197, 199),
                            )
                          ],
                        )

                      ],
                      )
                  ],
                ),
              ),
            ),
            SizedBox(height:18,),
            InkWell(
              child: Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                   color: Colormanager.primary,
                   borderRadius: BorderRadius.circular(20)
            
                ),
               
               child:Center(child: Text("Log Out",style: getSemiBoldStyle(color:Colormanager.white,fontSize:15),)),
               ),
               onTap: () {
                 
               },
            ),
          ],
        ) ),
    
    );
  }
}