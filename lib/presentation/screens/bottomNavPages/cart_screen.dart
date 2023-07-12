import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/routes_manager.dart';
import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/data/models/vehicledetails.dart';
import 'package:otodeals/presentation/widgets/payslip.dart';
import 'package:otodeals/presentation/widgets/textfildwidgets/customTextfield.dart';
import 'package:otodeals/presentation/widgets/textfildwidgets/numbertext.dart';
import 'package:otodeals/presentation/widgets/textfildwidgets/textfield.dart';

class CartScreen extends StatefulWidget {
const CartScreen({super.key});

@override
State<CartScreen> createState() => _CartScreenState();
    }

    class _CartScreenState extends State<CartScreen> {
        final token = Hive.box('token').get('api_token');
        @override
        Widget build(BuildContext context) {
        final size = MediaQuery.of(context).size;
        return Scaffold(
        backgroundColor: Colormanager.background,
        body:token == null
        ? Center(
        child: SizedBox(
        width: 200,
        child: ElevatedButton(
        onPressed: () {
        Navigator.pushNamedAndRemoveUntil(
        context, Routes.loginScreen, (route) => false);
        },
        style: ElevatedButton.styleFrom(
        backgroundColor: Colormanager.primary,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        ),
        ),
        child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
        'LOG IN',
        style: getBoldStyle(
        color: Colormanager.white,
        fontSize: 16,

        ),
        ),
        ),
        ),
        ),
        ) :SingleChildScrollView(
        child: SafeArea(
        child:Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        SizedBox(
        child: Row(
        children: [
        // InkWell(
        // // onTap: () {
        // // Navigator.pop(context);
        // // },
        // child: Icon(
        // Icons.arrow_back_ios,
        // color: Colormanager.primary,
        // size: 20,
        // )),
        SizedBox(
        width: 22,
        ),
        Text(
        "Sell My Car",
        style: getRegularStyle(
        color: Colormanager.black,
        fontSize: 20,
        ),
        )
        ],
        ),

        ),
        const SizedBox(height:20,),
        Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text("TELL ME ABOUT YOURSELF",style: getBoldStyle(color:Colormanager.black,fontSize: 18),),
        CustomTextField(hintText:'Enter Name',),
        CustomTextField(hintText: 'Enter Phone Number'),
          CustomTextField(hintText: 'Enter Email'),
            CustomTextField(hintText: 'Enter Your Address'),
              CustomTextField(hintText: 'Enter Your City'),
                CustomTextField(hintText: 'Enter Your Location'),
                SizedBox(height:30,),
                  Text("TELL ME ABOUT VEHICLE",style: getBoldStyle(color:Colormanager.black,fontSize: 18),),
                  CustomTextFielddrop(hintText:'Vehicle Type', dropdownOptions:const ['Buy','Bid',],),
                  CustomTextField(hintText:'Vehicle Model'),
                  CustomTextFielddrop(hintText: 'Vehicle Condition', dropdownOptions:const['Option1','Option2','Option3','Option4']),
                  CustomTextField(hintText:'Registeration UpTo'),
                  CustomTextField(hintText:'Insurance UpTo'),
                  CustomTextFielddrop(hintText:'Variant', dropdownOptions:['1','2','3']),
                  NumberTextField(labelText: 'Total Km',),
                   CustomTextField(hintText:'Enter More About Car Interior'),
                    CustomTextField(hintText:'Enter More About Car Exterior'),
                     CustomTextField(hintText:'Engine Condition'),
                     CustomTextField(hintText:'Tyre Conditions'),
                      CustomTextField(hintText:'AC Conditions'),
                       CustomTextField(hintText:'Accident History'),
                       NumberTextField(labelText: 'Price'),
                       SizedBox(height:30,),
                       Text("UPLOAD IMAGES",style: getBoldStyle(color: Colormanager.black,fontSize: 18),),
                       SizedBox(height: 15,),
                       UploadPaySlipScreen() ,
                       SizedBox(height: 30,),
                       Container(
                        width: MediaQuery.of(context).size.width,
                         child: ElevatedButton(onPressed: (){}, child:Text("Register Now",style: getSemiBoldStyle(color:Colormanager.white),),
                         style:ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colormanager.primary)
                         ) ,),
                       )

        ],
        ),

        )


        ],
        ),
        )
        ),

        )
        );
        }
        }
