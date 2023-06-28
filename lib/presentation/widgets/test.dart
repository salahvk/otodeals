import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/styles_manager.dart';

class DropdownContainer extends StatefulWidget {
  const DropdownContainer({super.key});

  @override
  _DropdownContainerState createState() => _DropdownContainerState();
}

class _DropdownContainerState extends State<DropdownContainer> {
 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
    
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
                         
                                 boxShadow:const [
                                 BoxShadow(
                                 blurRadius:5,
                                 color:Color.fromARGB(255, 198, 197, 197),
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
                            Icon(Icons.card_membership,color: Colormanager.primary,),
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
                          Icon(Icons.car_rental,color: Colormanager.primary,),
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
                          Icon(Icons.car_repair,color: Colormanager.primary,),
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
                          Icon(Icons.thermostat,color: Colormanager.primary,),
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
                         
                                 boxShadow:const [
                                 BoxShadow(
                                 blurRadius:5,
                                 color:Color.fromARGB(255, 198, 197, 197),
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
                         
                                 boxShadow:const [
                                 BoxShadow(
                                 blurRadius:5,
                                 color:Color.fromARGB(255, 198, 197, 197),
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
                         
                                 boxShadow:const [
                                 BoxShadow(
                                 blurRadius:5,
                                 color:Color.fromARGB(255, 198, 197, 197),
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
                         
                                 boxShadow:const [
                                 BoxShadow(
                                 blurRadius:5,
                                 color:Color.fromARGB(255, 198, 197, 197),
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
                         
                                 boxShadow:const [
                                 BoxShadow(
                                 blurRadius:5,
                                 color:Color.fromARGB(255, 198, 197, 197),
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
    );
  }
}