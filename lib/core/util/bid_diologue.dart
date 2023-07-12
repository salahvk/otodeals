import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/controllers.dart';
import 'package:otodeals/core/styles_manager.dart';

import 'package:otodeals/data/repositories/placebid.dart';



class BidDiologue extends StatefulWidget {

   BidDiologue({super.key,});

  @override
  State<BidDiologue> createState() => _BidDiologueState();
}

class _BidDiologueState extends State<BidDiologue> {

  int up = 2000;
  void initState() {
  super.initState();
 ProductController.bidController.text = up.toString();
}



  void increment() {
    print(up);
    setState(() {
      if (up >= 2000 && up < 50000) {
        up = up + 2000;
        ProductController.bidController.text=up.toString();
        print(up);
      }
    });
  }

  void decrement() {
    setState(() {
      if (up > 2000) {
        up = up - 2000;
        if(up-2000<2000){
          up=2000;
        }
        
            ProductController.bidController.text=up.toString();
      }
    });
  }
 

  @override
  Widget build(BuildContext context) {
  //   void homebid(index) async {
  //     final homeres = Provider.of<DataProvider>(context, listen:false);
  //     int? id = homeres.homemodel?.currentlyRunning![index].id;
  //     homeres.id = id;
  //  placeBid(context);
  //     print("errorrrr");
  //   }
    return AlertDialog(
      title: FractionallySizedBox(
        widthFactor: 0.5,
        child: ElevatedButton(
            onPressed: () {
              setState(() {
                  up=2000;
                  ProductController.bidController.text=up.toString();
              });
            
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colormanager.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Text("2000")),
      ),
      content: Container(
        height: 160,
        width: 210,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                        up=5000;
                            ProductController.bidController.text=up.toString();
                    });
                  
                  },
                  child: Container(
                    height: 20,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colormanager.grey,
                    ),
                    child: Center(
                        child: Text(
                      "5000",
                      style: getSemiBoldStyle(
                          color: Colormanager.black, fontSize: 12),
                    )),
                  ),
                ),
                InkWell(
                  onTap: () {
                 setState(() {
                      up=10000;
                          ProductController.bidController.text=up.toString();
                 });
                  },
                  child: Container(
                    height: 20,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colormanager.grey,
                    ),
                    child: Center(
                        child: Text(
                      "10000",
                      style: getSemiBoldStyle(
                          color: Colormanager.black, fontSize: 12),
                    )),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      up=20000;
                          ProductController.bidController.text=up.toString();
                    });
                  },
                  child: Container(
                    height: 20,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colormanager.grey,
                    ),
                    child: Center(
                        child: Text(
                      "20000",
                      style: getSemiBoldStyle(
                          color: Colormanager.black, fontSize: 12),
                    )),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, left: 0),
              child: Row(
                children: [
                  Container(
                      height: 28,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ElevatedButton(
                          onPressed: () {
                            decrement();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colormanager.white,
                          ),
                          child: Text(
                            "-",
                            style: getMediumtStyle(
                                color: Colormanager.black, fontSize: 20),
                          ))),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      width: 120,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colormanager.black),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: TextField(
                          controller: ProductController.bidController,
                          
                           decoration: InputDecoration(
                            
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent, // Set border color to transparent
                              ),
                              borderRadius: BorderRadius.circular(10), // Set border radius as desired
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent, // Set border color to transparent
                              ),
                              borderRadius: BorderRadius.circular(10), // Set border radius as desired
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent, // Set border color to transparent
                              ),
                              borderRadius: BorderRadius.circular(10), // Set border radius as desired
                            ),),
                                                textAlign: TextAlign.center,
                                                keyboardType: TextInputType.number,
                                                
                          onChanged: (value) {
                            setState(() {
                              up = int.parse(value);
                            });},
                                                style: getBoldStyle(
                            color: Colormanager.black, fontSize: 14),
                                              )),
                    ),
                  ),
                  Container(
                    height: 28,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      //  color: Colormanager.primary,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        increment();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colormanager.white,
                      ),
                      child: Center(
                          child: Icon(
                        Icons.add,
                        color: Colormanager.black,
                        size: 18,
                      )),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                width: 130,
                child: ElevatedButton(
                    onPressed: ()async {
                         placeBid(context);
                // homebid(index)

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colormanager.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      "Place Bid",
                      style: getSemiBoldStyle(
                          color: Colormanager.white, fontSize: 16),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
