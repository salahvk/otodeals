import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/controllers.dart';
import 'package:otodeals/core/styles_manager.dart';


class PaymentButton extends StatefulWidget {
  const PaymentButton({Key? key}) : super(key: key);

  @override
  State<PaymentButton> createState() => _PaymentButtonState();
}

class _PaymentButtonState extends State<PaymentButton> {
   PaystoreController? controller;
  int up=0;

  

  void increment(){

    setState(() {
      if(up>=500&&up<50000) {
        up++;
        PaystoreController.paymentamount.text=up.toString();
      }
    });
  }
  void decrement(){

    setState(() {
      if(up>5000) {
        up--;
         PaystoreController.paymentamount.text=up.toString();
      }
    });
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
     PaystoreController.paymentamount.text = '5000';
        up = int.parse(PaystoreController.paymentamount.text) ;
     
  }
  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.only(top:4.0,left:8),
      child: Row(children: [
       Container(height:28,
        // width:30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
               color: Colormanager.primary,
        ),
   
        child: ElevatedButton(onPressed: (){decrement();}, child: Text("-",style: getMediumtStyle(color: Colormanager.white,fontSize:20),),style:  ElevatedButton.styleFrom(
                primary: Colormanager.primary,
              
              ))),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(width:120,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colormanager.black
    
              
            ),
            borderRadius: BorderRadius.circular(10)
    
          ),
          child: Padding(
            padding: const EdgeInsets.only(left:40.0),
            child: TextFormField(decoration: InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),controller:PaystoreController.paymentamount    ,style: getBoldStyle(color: Colormanager.black,fontSize:14),),
          ),),
        ),
        
            Container(
              height:28,
              // width: 20,
             decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
               color: Colormanager.primary,
        ),
              child: ElevatedButton(onPressed: (){increment();}, child:Center(child: Icon(Icons.add,color: Colormanager.white,size: 18,)),style:
              ElevatedButton.styleFrom(
                primary: Colormanager.primary,
                
              ),),
            ),
      ],),
    );
  }
}