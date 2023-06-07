import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/routes_manager.dart';
import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/presentation/screens/bottomNavPages/profile.dart';
import 'package:otodeals/presentation/widgets/bottom_nav.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor:Colormanager.background,
      body: SafeArea(
        child:Column(
          children: [
            Container(
              height:50,
              width:MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_ios,color: Colormanager.primary,size:20,),
                    SizedBox(width: 20,),
                    Text("Edit Profile",style:getRegularStyle(
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
                      SizedBox(height: 30,),
                      Row(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:20.0,top: 2),
                                child: Stack(
                                  children:[Container(
                                    height:69,
                                    width: 85,
                                    decoration: BoxDecoration(
                                      color:Colormanager.white,
                                      borderRadius: BorderRadius.circular(45),
                                     
                                      image:DecorationImage(image:AssetImage('assets/profileavatar.jpg',),fit: BoxFit.cover)
                                    ),
                                    
                                    
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top:55,left:30),
                                    child: Container(
                                      height:27,
                                      width: 27,
                                      decoration: BoxDecoration(
                                         boxShadow:[
                                  BoxShadow(
                                    blurRadius:5,
                                    color:Colormanager.white,
                                    spreadRadius:0,
                                    offset: Offset(0,4))],
                                        color: Colormanager.white,
                                        borderRadius: BorderRadius.circular(20)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom:1),
                                        child:Image.asset('assets/Instagram-Camera-Icon-oi3r3s.png',color: Colormanager.primary,height:3,width:3,)
                                      )),
                                  )
                             ] ),
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
                                    Navigator.of(context).push(FadePageRoute(page:Myprofile()));
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
              height: 280,
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
                   
                    
                      SizedBox(height: 15,),
                      Row(
                         children: [
                        SvgPicture.asset('assets/drawer_icons/person-8.svg',height:20,color: Color.fromARGB(255, 112, 112, 114),),
                        SizedBox(width:20,),
                        Column(
                          
                          children: [
                            Row(
                              
                              children: [
                                Text("Name",
                                style:getSemiBoldStyle(color: Color.fromARGB(255, 112, 112, 114,),fontSize:12),),
                                SizedBox(width:150,),
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
                        Icon(Icons.mail_outline,color: Color.fromARGB(255, 99, 99, 99),),
                        SizedBox(width:15,),
                        Column(
                          
                          children: [
                            Row(
                              
                              children: [
                                Text("Email Id",
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
                              color: Color.fromARGB(255, 216, 216, 218),
                            )
                          ],
                        )

                      ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                         children: [
                        Icon(Icons.phone_android,color: Color.fromARGB(255, 92, 91, 91),),
                        SizedBox(width:15,),
                        Column(
                          
                          children: [
                            Row(
                              
                              children: [
                                Text("Phone number",
                                style:getSemiBoldStyle(color: Color.fromARGB(255, 112, 112, 114) ),),
                                SizedBox(width:96,),
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
                        Icon(Icons.location_pin,color: Color.fromARGB(255, 112, 112, 114),),
                        SizedBox(width:17,),
                        Column(
                          
                          children: [
                            Row(
                              
                              children: [
                                Text("Location",
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
               
               child:Center(child: Text("Update",style: getSemiBoldStyle(color:Colormanager.white,fontSize:15),)),
               ),
               onTap: () {
                 Navigator.of(context).pushNamed(Routes.profilescreen);
               },
            ),
          ],
        ) ), 
        bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}