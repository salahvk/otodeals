import 'package:flutter/material.dart';
import 'package:otodeals/core/asset_manager.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/routes_manager.dart';
import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/data/providers/dataprovider.dart';
import 'package:otodeals/data/repositories/paymentstore.dart';
import 'package:otodeals/data/repositories/subscriptionpackage.dart';
// import 'package:otodeals/presentation/widgets/numberinput.dart';
import 'package:otodeals/presentation/widgets/numberinputvalpackage.dart';
import 'package:otodeals/presentation/widgets/payslip.dart';
import 'package:provider/provider.dart';

class Paymentpage extends StatefulWidget {
  const Paymentpage({super.key});

  @override
  State<Paymentpage> createState() => _PaymentpageState();
}

class _PaymentpageState extends State<Paymentpage> {
    void initState() {
  
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await getsubscription(context);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final payres=Provider.of<DataProvider>(context,listen:false);
       final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
               SizedBox(
                  height: size.height * .06,
                ),
           
            Center(child: Image.asset(AssetImages.logoBlack)),
                SizedBox(
                  height: size.height * .08,
                ),
                Text("Please Subscribe Validity Package To \nContinue",style:getSemiBoldStyle(color:Colormanager.black,fontSize:16),),
                
                SizedBox(
                  height: 145,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: payres.paydata?.paymentDetails?.length??0,
                     itemBuilder: (BuildContext context,int index) {  
                    return Padding(
                      padding: const EdgeInsets.only(top:20.0),
                      child: Container(
                        // color: Colors.amber,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("${payres.paydata?.paymentDetails![index].displayName??""}\t:",style: getMediumtStyle(color:Colormanager.textColor,fontSize: 14),),
                            SizedBox(width:10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(payres.paydata?.paymentDetails![index].value??""),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                     }
                  ),
                ),  
                //  Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Text("Subscription Charges\t:",style: getMediumtStyle(color:Colormanager.textColor,fontSize: 14),)
                //   ],
                // ),
                //    SizedBox(
                //   height: size.height * .04,
                // ),
                //  Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Text("Validity In Months\t:",style: getMediumtStyle(color:Colormanager.textColor,fontSize: 14),)
                //   ],
                // ),
                   SizedBox(
                  height: size.height * .01,
                ),
                Text("Payment Amount",style: getMediumtStyle(color:Colormanager.textColor,fontSize: 14),),
                      SizedBox(
                  height: size.height * .02,
                ),
                PaymentButton(),
                     SizedBox(
                  height: size.height * .02,
                ),
                 Text("Pay your amount to above bank account",style: getMediumtStyle(color:Colormanager.greyText,fontSize:11.5),),
                      SizedBox(
                  height: size.height * .06,
                ),
                 Text("Upload Pay Slip Or Screenshot",style:getSemiBoldStyle(color:Colormanager.black,fontSize:16),),
                      SizedBox(
                  height: size.height * .02,
                ),

                UploadPaySlipScreen(),
                     SizedBox(
                  height: size.height * .06,
                ),
                Center(
                  child: ElevatedButton(onPressed: ()async{
                   await getpaystore(context);
                   Navigator.pushNamed(context,Routes.loginScreen);

                  }, child:Center(child:Text("Pay",style: getSemiBoldStyle(color:Colormanager.white),)),
                  style:
              ElevatedButton.styleFrom(
                primary: Colormanager.primary,
                
              ),),
                )

                

          ],
        ),
      ),
    );
  }
}