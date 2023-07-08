import 'package:flutter/material.dart';
import 'package:otodeals/core/asset_manager.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/styles_manager.dart';
// import 'package:otodeals/presentation/widgets/numberinput.dart';
import 'package:otodeals/presentation/widgets/numberinputvalpackage.dart';
import 'package:otodeals/presentation/widgets/payslip.dart';

class Paymentpage extends StatefulWidget {
  const Paymentpage({super.key});

  @override
  State<Paymentpage> createState() => _PaymentpageState();
}

class _PaymentpageState extends State<Paymentpage> {
  @override
  Widget build(BuildContext context) {
       final size = MediaQuery.of(context).size;
    return Scaffold(
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
                  height: size.height * .04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Bank Account Details\t:",style: getMediumtStyle(color:Colormanager.textColor,fontSize: 14),)
                  ],
                ),   SizedBox(
                  height: size.height * .04,
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Subscription Charges\t:",style: getMediumtStyle(color:Colormanager.textColor,fontSize: 14),)
                  ],
                ),
                   SizedBox(
                  height: size.height * .04,
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Validity In Months\t:",style: getMediumtStyle(color:Colormanager.textColor,fontSize: 14),)
                  ],
                ),
                   SizedBox(
                  height: size.height * .04,
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

                

          ],
        ),
      ),
    );
  }
}