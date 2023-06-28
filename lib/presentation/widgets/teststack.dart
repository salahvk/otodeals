import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/styles_manager.dart';

class Testwrk extends StatefulWidget {
  const Testwrk({super.key});

  @override
  State<Testwrk> createState() => _TestwrkState();
}

class _TestwrkState extends State<Testwrk> {
  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
           SizedBox(
                    height: size.height *.29,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 5, right: 20),
                          child: Container(
                            height: size.height*.24,
                            width: size.width/1.9,
                            color: Colors.white,
                            child: Stack(
                              
        children:[ Container(
        height:140,
        width:size.width,
        decoration: BoxDecoration(
        color: Colormanager.primary,
        borderRadius:
        BorderRadius.only(topLeft:Radius.circular(10),topRight:Radius.circular(10),bottomLeft:Radius.circular(20),bottomRight:
        Radius.circular(20) )
        
        ),
        child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Padding(
        padding: const EdgeInsets.only(top:10.0,left:10),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text("HYUNDAI",style: getSemiBoldStyle(color: Colormanager.white,fontSize:10),),
        SizedBox(height:3,),
        Text("\$56.7",style: getBoldStyle(color: Colormanager.white,fontSize:10),)
        ],
        ),
        ),
        Padding(
        padding: const EdgeInsets.only(left:80.0,top:15),
        child: Container(
        height:20,
        width: 20,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        
        boxShadow:const [
        BoxShadow(
        blurRadius:5,
        color:Colormanager.white,
        spreadRadius:0,
        offset: Offset(0,4))],
        color: Colormanager.white
        ),
        child:Icon(Icons.favorite,size:17,color: Colormanager.primary,)),
        )
        
        ],
        ),
        ),
        Padding(
        padding: const EdgeInsets.only(top:80.0),
        child: Container(
        height:size.height/3,
        width: MediaQuery.of(context).size.width/1.5,

        decoration: BoxDecoration(
        color:Colormanager.white,
        borderRadius:
        BorderRadius.only(topLeft:Radius.circular(40),topRight:Radius.circular(40),bottomLeft:Radius.circular(10),bottomRight:Radius.circular(10)),
        boxShadow: const [
        BoxShadow(
        blurRadius:4,
        color: Color.fromARGB(255, 147, 146, 146)

        )
        ]
        ),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.start,
        children: [
        Padding(
        padding: const EdgeInsets.only(top:30),
        child: Container(
        height:22,
        width: 37,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.amber,
        ),
        child: Padding(
        padding: const EdgeInsets.only(left:5.0),
        child: Row(
        children: [
        Icon(Icons.star,color: Colors.white,size:10,),
        Text("4.5",style: getSemiBoldStyle(color:Colormanager.white,fontSize:10),)
        ],
        ),
        ),
        ),
        ),
        SizedBox(height:2,),
        Padding(
        padding: const EdgeInsets.all(2.0),
        child: Row(
        children:[
        Padding(
        padding: const EdgeInsets.only(left:30.0),
        child: Container(
        height:50 ,
        width: 50,
        decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.circular(10)),
        child: Center(
        child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
        children: [
        Image.asset('assets/speedometer-icon.png',height:15,width:15,),
        SizedBox(
        height:2,
        ),

        Text("Automatic", style:getSemiBoldStyle(color:Colormanager.primary,fontSize:8),),
        ],
        ),
        ),
        ),
        ),
        ),
        Container(
        height:50 ,
        width: 50,
        decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.circular(10)),
        child: Center(
        child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
        children: [
        Image.asset('assets/car-seat-belt-icon.png',height:15,width:15,),
        SizedBox(
        height:2,
        ),

        Text("5 seats", style:getSemiBoldStyle(color:Colormanager.primary,fontSize:8),),
        ],
        ),
        ),
        ),
        ),
        Container(
        height:50 ,
        width: 50,
        decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.circular(10)),
        child: Center(
        child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
        children: [
        SvgPicture.asset('assets/drawer_icons/gasoline-pump-svgrepo-com.svg',height:15,width:15,),
        SizedBox(
        height:2,
        ),

        Text("diesel", style:getSemiBoldStyle(color:Colormanager.primary,fontSize:8),),
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
        padding: const EdgeInsets.only(left:10,right:10,bottom:60),
        child: Image.asset('assets/result.png',height:200,width:200,),
        ),
        ]),)
                        );
                      },
                      itemCount: 10,
                    ),
                  ),
        ],
      ),
    );
  }
}