import 'package:flutter/material.dart';
import 'package:otodeals/core/asset_manager.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/routes_manager.dart';
import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/data/api/api_endpoint.dart';
import 'package:otodeals/data/providers/dataprovider.dart';
import 'package:otodeals/data/repositories/vehicledetails.dart';
import 'package:otodeals/presentation/screens/productdetails.dart';
import 'package:otodeals/presentation/widgets/custom_drawer.dart';
import 'package:otodeals/presentation/widgets/livetimer.dart';
import 'package:otodeals/presentation/widgets/numberinput.dart';
import 'package:otodeals/presentation/widgets/timer.dart';
import 'package:otodeals/presentation/widgets/timer2.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
const HomeScreen({Key? key}) : super(key: key);

@override
State<HomeScreen> createState() => _HomeScreenState();
    }

    class _HomeScreenState extends State<HomeScreen> {
        bool isBuySelected = true;
        int selectedContainer = 0;
        bool isRowVisible = true;

        @override
        void initState() {
        super.initState();
        }

        void toggleSelection(bool isBuy) async {
        setState(() {
        isBuySelected = isBuy;
       
        });
        }

        

            

                    int current = 0;

                    @override
                    Widget build(BuildContext context) {
                    final size = MediaQuery.of(context).size;
                   final homeres = Provider.of<DataProvider>(context, listen:true);
                        
                        return Scaffold(
                        endDrawer: SizedBox(
                        height: size.height,
                        width: size.width * 0.7,
                        child: const CustomDrawer(),
                        ),
                        body: SafeArea(
                        child: SingleChildScrollView(
                        child: Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Column(
                        children: [
                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        SizedBox(
                        width: size.width * .4,
                        height: 40,
                        child: Image.asset(AssetImages.logoBlack),
                        ),
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
                        const SizedBox(
                        height: 10,
                        ),
                        Container(
                        height: 80,
                        width: size.width,
                        color: Colormanager.background,
                        child: Column(
                        children: [
                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        Padding(
                        padding: const EdgeInsets.only(top: 0.0),
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(
                        "Drive Your",
                        style: getMediumtStyle(
                        color:
                        const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 22),
                        ),
                        Row(
                        children: [
                        Text(
                        "Dreams",
                        style: getMediumtStyle(
                        color: Colormanager.primary,
                        fontSize: 22),
                        ),
                        SizedBox(
                        width: 8,
                        ),
                        Image.asset(
                        'assets/slide_layer.png',
                        height: 24,
                        ),
                        ],
                        ),
                        ],
                        ),
                        ),
                        Image.asset(
                        "assets/oto.jpg",
                        height: 80,
                        width: 130,
                        )
                        ],
                        ),
                        ],
                        ),
                        ),
                        const SizedBox(
                        height: 30,
                        ),
                        Text(
                        homeres.homemodel?.nextAccutionTime?.label ?? "",
                        style: getSemiBoldStyle(
                        color: Colors.black, fontSize: 19),
                        ),
                        const SizedBox(
                        height: 30,
                        ),
                        TimerScreen(),
                        const SizedBox(
                        height: 20,
                        ),
                        Padding(
                        padding: const EdgeInsets.only(left: 260.0),
                        child: Container(
                        width: 90.0,
                        height: 25.0,
                        decoration: BoxDecoration(
                        color: Colormanager.primary,
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
                        onTap: () { toggleSelection(true);
                        isRowVisible=false;
                        },
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
                      isRowVisible=true;
                     
                        
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
                        ),
                        const SizedBox(
                        height: 10,
                        ),
                        Padding(
                        padding: const EdgeInsets.all(.0),
                        child: Column(
                        children: [
                        SizedBox(height: 20),
                        Visibility(
                          visible: isRowVisible,
                          child: Column(
                            children: [
                              Row(
                              children: [
                              Expanded(
                              child: GestureDetector(
                              onTap: () {
                              setState(() {
                              selectedContainer = 1;
                              });
                              },
                              child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                              // color: selectedContainer == 1 ? Colors.blue : Colors.transparent,
                              ),
                              child: Center(
                              child: Text(
                              'LIVE',
                              style: getMediumtStyle(
                              fontSize: 15,
                              color: const Color.fromARGB(
                              255, 33, 32, 32),
                              ),
                              ),
                              ),
                              ),
                              ),
                              ),
                              Expanded(
                              child: GestureDetector(
                              onTap: () {
                              setState(() {
                              selectedContainer = 2;
                              });
                              },
                              child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                              // color: selectedContainer == 2 ? Colors.blue : Colors.transparent,
                              ),
                              child: Center(
                              child: Text(
                              'UPCOMING',
                              style: getMediumtStyle(
                              color: const Color.fromARGB(
                              255, 33, 32, 32),
                              fontSize: 15,
                              ),
                              ),
                              ),
                              ),
                              ),
                              ),
                              ],
                              ),
                         
                        SizedBox(height: 2),
                        Row(
                        children: [
                        Padding(
                        padding: const EdgeInsets.only(
                        left: 12.0, right: 5.4),
                        child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 2,
                        width: MediaQuery.of(context).size.width / 2.5,
                        margin: EdgeInsets.only(
                        left: selectedContainer == 1
                        ? 0
                        : MediaQuery.of(context).size.width /
                        1.8),
                        color: Colormanager.primary,
                        ),
                        ),
                        ],
                        ),
                           ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                        padding: const EdgeInsets.only(left:0.0),
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        Container(
                        height: 20,
                        width: 105,
                        
                        
                        decoration: BoxDecoration(
                        color: Colormanager.grey,
                        borderRadius: BorderRadius.circular(5)
                        ),
                        child: Center(child: Text("PREMIUM CAR",style:
                        getMediumtStyle(color:Colormanager.black,fontSize:10),)),
                        ),
                        Container(
                        height: 20,
                        width: 160,
                        decoration: BoxDecoration(
                        color: Colormanager.grey,
                        borderRadius: BorderRadius.circular(5)
                        ),
                        child: Center(child: Text("NO STRUCTURAL DAMAGE",style:
                        getMediumtStyle(color:Colormanager.black,fontSize:10),)),
                        ),
                        Container(
                        height: 20,
                        width: 105,
                        decoration: BoxDecoration(
                        color: Colormanager.grey,
                        borderRadius: BorderRadius.circular(5)
                        ),
                        child: Center(child: Text("1st OWNER",style:
                        getMediumtStyle(color:Colormanager.black,fontSize:10),)),
                        ),
                        ],
                        ),
                        )
                        ],
                        ),
                        ),
                        const SizedBox(
                        height: 30,
                        ),
                       isBuySelected?Buy():selectedContainer==1?Live():Upcoming()
                       
                   
                        ],
                        ),
                        ),
                        ),
                        ),
                        );
                        }
                        }

                        class Live extends StatefulWidget {
                        const Live({super.key});

  @override
  State<Live> createState() => _LiveState();
}

class _LiveState extends State<Live> {
                        void inputcurrentlyrunnigbid(index) {
        final homeres = Provider.of<DataProvider>(context, listen:true);
            int? id = homeres.homemodel?.currentlyRunning![index].id;
            homeres.id = id;
            getvehicledetails(context, id!);
            Navigator.of(context).push(FadePageRoute(page: Porductdetails()));
            }

                        @override
                        Widget build(BuildContext context) {
                          final homeres = Provider.of<DataProvider>(context, listen:true);

                        final size = MediaQuery.of(context).size;

                        return Container(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: 10,
                             shrinkWrap: true,
                                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              
                              
                        
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: InkWell(
                                onTap: () {
                                  // inputcurrentlyrunnigbid(index);
                                },
                                child: Container(
                                height: size.height/3.7,
                                width: size.width/1.17,
                                                        
                                                        
                                decoration: BoxDecoration(
                                color:Colormanager.background,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow:[BoxShadow(
                                color: const Color.fromARGB(255, 194, 193, 193).withOpacity(0.5), // Shadow color
                                spreadRadius: 5, // Spread radius of the shadow
                                blurRadius: 6, // Blur radius of the shadow
                                offset: Offset(0, 3), // Offset of the shadow
                                ),]
                                ),
                                child: Column(
                                children: [
                                Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                  Text(homeres.homemodel?.currentlyRunning![index].vehicleName??"", style: getSemiBoldStyle(
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
                                ),
                                                    
                                Container(
                                  height:70,
                                  width: 150,
                                  child:  Image.network("$endpoint ${homeres.homemodel?.currentlyRunning?[index].image}"),
                                ),
                                const SizedBox(
                                  height:10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                      Container(
                                height: 20,
                                width: 70,
                                                        
                                                        
                                decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 167, 167),
                                borderRadius: BorderRadius.circular(5)
                                ),
                                child: Center(child: Text("ENGINE",style:
                                getMediumtStyle(color:Colormanager.primary,fontSize:10),)),
                                ),
                                  Container(
                                height: 20,
                                width: 50,
                                                        
                                                        
                                decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 167, 167),
                                borderRadius: BorderRadius.circular(5)
                                ),
                                child: Center(child: Text(homeres.homemodel?.currentlyRunning![index].fueltype??"",style:
                                getMediumtStyle(color:Colormanager.primary,fontSize:10),)),
                                ),
                                 Container(
                                height: 20,
                                width: 60,
                                                        
                                                        
                                decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 167, 167),
                                borderRadius: BorderRadius.circular(5)
                                ),
                                child: Center(child: Text("35667 KM",style:
                                getMediumtStyle(color:Colormanager.primary,fontSize:10),)),
                                ),
                                 Container(
                                height: 20,
                                width: 80,
                                                        
                                                        
                                decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 167, 167),
                                borderRadius: BorderRadius.circular(5)
                                ),
                                child: Center(child: Text("1st OWNER",style:
                                getMediumtStyle(color:Colormanager.primary,fontSize:10),)),
                                ),
                                    
                                  ],
                                ),
                                const SizedBox(height: 5,),
                                Padding(
                                  padding: const EdgeInsets.only(left:8.0,right:15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Highest Bid",style: getMediumtStyle(color:Colors.black,fontSize:12),),
                                       Text("Last Call",style: getMediumtStyle(color:Colormanager.primary,fontSize:12),)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left:8.0,right:10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                       Text(homeres.homemodel?.currentlyRunning![index].price.toString()??"",
                                              style: getMediumtStyle(
                                                  color: Colors.black,
                                                  fontSize: 10)),
                                                  LivetimerScreen(index)
                                
                                    ],
                                  ),
                                )
                                                        
                                                        
                                ],
                                                        
                                ),
                                ),
                              ),
                            );
                          }),
                        );
                        }
}

                        class Upcoming extends StatefulWidget {
                        const Upcoming({super.key});

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  
                void inputbidnow(index) {
                final homeres = Provider.of<DataProvider>(context, listen: false);
                    int? id = homeres.homemodel?.bidVehicles![index].id;
                    homeres.id = id;
                    getvehicledetails(context, id!);
                    Navigator.of(context).push(FadePageRoute(page: Porductdetails()));
                    }

                        @override
                        Widget build(BuildContext context) {
                             final homeres = Provider.of<DataProvider>(context, listen:true);

                        final size = MediaQuery.of(context).size;
                        
                        return  Container(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: homeres.homemodel?.bidVehicles?.length,
                             shrinkWrap: true,
                                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              
                            
                        
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                              height: size.height/3.6,
                              width: size.width/1.16,
                                                      
                                                      
                              decoration: BoxDecoration(
                              color:Colormanager.background,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow:[BoxShadow(
                              color: const Color.fromARGB(255, 194, 193, 193).withOpacity(0.5), // Shadow color
                              spreadRadius: 5, // Spread radius of the shadow
                              blurRadius: 6, // Blur radius of the shadow
                              offset: Offset(0, 3), // Offset of the shadow
                              ),]
                              ),
                              child: Column(
                              children: [
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                Text(homeres.homemodel?.bidVehicles![index].vehicleName??"", style: getSemiBoldStyle(
                                color: Colors.black)),
                                //  Container(
                                //                   width: 40,
                                //                   height: 15,
                                //                   decoration: BoxDecoration(
                                //                       color: Colormanager.primary,
                                //                       borderRadius:
                                //                           BorderRadius.circular(15)),
                                //                   child: Center(
                                //                     child: Text(
                                //                       "Bid Now",
                                //                       style: getRegularStyle(
                                //                           color: Colormanager.white,
                                //                           fontSize: 7),
                                //                     ),
                                //                   ),
                                //                 )
                              
                                ],
                              
                                ),
                              ),
                                                  
                              Container(
                                height:70,
                                width: 150,
                                child: Image.network("$endpoint ${homeres.homemodel?.bidVehicles?[index].image}"),
                              ),
                              const SizedBox(
                                height:10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                    Container(
                              height: 20,
                              width: 70,
                                                      
                                                      
                              decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 167, 167),
                              borderRadius: BorderRadius.circular(5)
                              ),
                              child: Center(child: Text("ENGINE",style:
                              getMediumtStyle(color:Colormanager.primary,fontSize:10),)),
                              ),
                                Container(
                              height: 20,
                              width: 50,
                                                      
                                                      
                              decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 167, 167),
                              borderRadius: BorderRadius.circular(5)
                              ),
                              child: Center(child: Text(homeres.homemodel?.bidVehicles![index].fueltype??"",style:
                              getMediumtStyle(color:Colormanager.primary,fontSize:10),)),
                              ),
                               Container(
                              height: 20,
                              width: 60,
                                                      
                                                      
                              decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 167, 167),
                              borderRadius: BorderRadius.circular(5)
                              ),
                              child: Center(child: Text("35667 KM",style:
                              getMediumtStyle(color:Colormanager.primary,fontSize:10),)),
                              ),
                               Container(
                              height: 20,
                              width: 80,
                                                      
                                                      
                              decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 167, 167),
                              borderRadius: BorderRadius.circular(5)
                              ),
                              child: Center(child: Text("1st OWNER",style:
                              getMediumtStyle(color:Colormanager.primary,fontSize:10),)),
                              ),
                                  
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Minimum Bid Amount",style: getMediumtStyle(color:Colors.black,fontSize:12),),
                                     Padding(
                                       padding: const EdgeInsets.only(left:120.0),
                                       child: Text("Starts In",style: getMediumtStyle(color:Colormanager.primary,fontSize:12),),
                                     )
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                       Padding(
                                         padding: const EdgeInsets.only(left:8.0),
                                         child: Text(homeres.homemodel?.bidVehicles![index].price.toString()??"",
                                                style: getMediumtStyle(
                                                    color: Colors.black,
                                                    fontSize: 10)),
                                       ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(right:10),
                                                    child: AttendanceScreen(index),
                                                  ),
                                    ],
                                  ),
                                                      
                                                      
                              ],
                                                      
                              ),
                              ),
                            );
                          }),
                        );
                        }
}
 class Buy extends StatefulWidget {
                        const Buy({super.key});

  @override
  State<Buy> createState() => _BuyState();
}

class _BuyState extends State<Buy> {
   void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:FractionallySizedBox(
            widthFactor: 0.5,
            child: ElevatedButton(onPressed: (){}, child:Text("2000"), style: ElevatedButton.styleFrom(
                        backgroundColor: Colormanager.primary,
                        shape: RoundedRectangleBorder(
                          
                          borderRadius: BorderRadius.circular(15),
                        ),
                        )),
          ),
          content: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 20,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                       color: Colormanager.grey,

                    ),
                    child: Center(child: Text("5000",style: getSemiBoldStyle(color:Colormanager.black,fontSize:12 ),)),
                  ),
                  Container(
                    height: 20,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                       color: Colormanager.grey,

                    ),
                    child: Center(child: Text("10000",style: getSemiBoldStyle(color:Colormanager.black,fontSize:12 ),)),
                  ),
                  Container(
                    height: 20,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                       color: Colormanager.grey,

                    ),
                    child: Center(child: Text("20000",style: getSemiBoldStyle(color:Colormanager.black,fontSize:12 ),)),
                  ),
              
                ],
              ),
              const SizedBox(height: 20,),
                  AddButton(),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(onPressed: (){}, child:Text("place Bid"), style: ElevatedButton.styleFrom(
                        backgroundColor: Colormanager.primary,
                        shape: RoundedRectangleBorder(
                          
                          borderRadius: BorderRadius.circular(15),
                        ),
                        )),
          ],
        );
      },
    );
  }
  void inputlatestarrivals(index) async{
            final homeres = Provider.of<DataProvider>(context, listen: false);
                int? id = homeres.homemodel?.saleVehicles![index].id;
                homeres.id = id;
           await     getvehicledetails(context, id!);
             
                Navigator.of(context).push(FadePageRoute(page: Porductdetails()));
                }
                        @override
                        Widget build(BuildContext context) {
                           final homeres = Provider.of<DataProvider>(context, listen:true);

                        final size = MediaQuery.of(context).size;
                        return  Container(
                          child: ListView.builder(
                            
                            scrollDirection: Axis.vertical,
                            itemCount: homeres.homemodel?.saleVehicles?.length??0,
                             shrinkWrap: true,
                                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                                 print(homeres.homemodel?.saleVehicles?.length);
                print("aaaaaaaaaaaaaa");
                              
                            
                        
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                              height: size.height/3.9,
                              width: size.width/1.17,
                                                      
                                                      
                              decoration: BoxDecoration(
                              color:Colormanager.background,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow:[BoxShadow(
                              color: const Color.fromARGB(255, 194, 193, 193).withOpacity(0.5), // Shadow color
                              spreadRadius: 5, // Spread radius of the shadow
                              blurRadius: 6, // Blur radius of the shadow
                              offset: Offset(0, 3), // Offset of the shadow
                              ),]
                              ),
                              child: Column(
                              children: [
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                Text(homeres.homemodel?.saleVehicles![index].vehicleName??"", style: getSemiBoldStyle(
                                color: Colors.black)),
                                 InkWell(
                                  onTap: () => _showDialog(context),
                                   child: Container(
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
                                                  ),
                                 )
                              
                                ],
                              
                                ),
                              ),
                                                  
                              Container(
                                height:70,
                                width: 150,
                                child: Image.network("$endpoint ${homeres.homemodel?.saleVehicles?[index].image}"),
                              ),
                              const SizedBox(
                                height:10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                    Container(
                              height: 20,
                              width: 70,
                                                      
                                                      
                              decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 167, 167),
                              borderRadius: BorderRadius.circular(5)
                              ),
                              child: Center(child: Text("ENGINE",style:
                              getMediumtStyle(color:Colormanager.primary,fontSize:10),)),
                              ),
                                Container(
                              height: 20,
                              width: 50,
                                                      
                                                      
                              decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 167, 167),
                              borderRadius: BorderRadius.circular(5)
                              ),
                              child: Center(child: Text(homeres.homemodel?.saleVehicles![index].fueltype??"",style:
                              getMediumtStyle(color:Colormanager.primary,fontSize:10),)),
                              ),
                               Container(
                              height: 20,
                              width: 60,
                                                      
                                                      
                              decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 167, 167),
                              borderRadius: BorderRadius.circular(5)
                              ),
                              child: Center(child: Text("35667 KM",style:
                              getMediumtStyle(color:Colormanager.primary,fontSize:10),)),
                              ),
                               Container(
                              height: 20,
                              width: 80,
                                                      
                                                      
                              decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 167, 167),
                              borderRadius: BorderRadius.circular(5)
                              ),
                              child: Center(child: Text("1st OWNER",style:
                              getMediumtStyle(color:Colormanager.primary,fontSize:10),)),
                              ),
                                  
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Highest Bid",style: getMediumtStyle(color:Colors.black,fontSize:12),),
                                    
                                  ],
                                ),
                              ),
                               Padding(
                                 padding: const EdgeInsets.only(left:12.0,right: 12,bottom:4),
                                 child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                         Text(homeres.homemodel?.saleVehicles![index].price.toString()??"",
                                                style: getMediumtStyle(
                                                    color: Colors.black,
                                                    fontSize: 10)),
                                                     InkWell(
                                                      onTap:(){},
                                                       child: Container(
                                                                                                       width: 70,
                                                                                                       height: 17,
                                                                                                       decoration: BoxDecoration(
                                                        color: Colormanager.primary,
                                                        borderRadius:
                                                            BorderRadius.circular(15)),
                                                                                                       child: Center(
                                                                                                         child: Text(
                                                        "Request to Buy",
                                                        style: getSemiBoldStyle(
                                                            color: Colormanager.white,
                                                            fontSize: 8),
                                                                                                         ),
                                                                                                       ),
                                                                                                     ),
                                                     )
                                      ],
                                    ),
                               ),
                                                      
                                                      
                              ],
                                                      
                              ),
                              ),
                            );
                          }),
                        );
                        }
}
 