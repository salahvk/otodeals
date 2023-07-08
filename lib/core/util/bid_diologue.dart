import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/styles_manager.dart';

class BidDiologue extends StatefulWidget {
  const BidDiologue({super.key});

  @override
  State<BidDiologue> createState() => _BidDiologueState();
}

class _BidDiologueState extends State<BidDiologue> {
  int up = 5000;

  void increment() {
    print(up);
    setState(() {
      if (up >= 5000 && up < 50000) {
        up = up + 2000;
        print(up);
      }
    });
  }

  void decrement() {
    setState(() {
      if (up > 5000) {
        up = up - 2000;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: FractionallySizedBox(
        widthFactor: 0.5,
        child: ElevatedButton(
            onPressed: () {},
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
                Container(
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
                Container(
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
                Container(
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
                          child: Text(
                        '$up',
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
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colormanager.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      "place Bid",
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
