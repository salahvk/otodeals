import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/controllers.dart';
import 'package:otodeals/core/routes_manager.dart';
import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/data/repositories/sell_now.dart';
import 'package:otodeals/presentation/widgets/payslip.dart';
import 'package:otodeals/presentation/widgets/textfildwidgets/customTextfield.dart';
import 'package:otodeals/presentation/widgets/textfildwidgets/textfield.dart';

class SaleScreen extends StatefulWidget {
  const SaleScreen({super.key});

  @override
  State<SaleScreen> createState() => _SaleScreenState();
}

class _SaleScreenState extends State<SaleScreen> {
  final token = Hive.box('token').get('api_token');
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colormanager.background,
        body: token == null
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
              )
            : SingleChildScrollView(
                child: SafeArea(
                    child: Padding(
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
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "TELL ME ABOUT YOURSELF",
                              style: getBoldStyle(
                                  color: Colormanager.black, fontSize: 18),
                            ),
                            CustomTextField(
                              hintText: 'Enter Name',
                              controller: SaleController.nameController,
                            ),
                            CustomTextField(
                                hintText: 'Enter Phone Number',
                                controller: SaleController.phoneController),
                            CustomTextField(
                                hintText: 'Enter Email',
                                controller: SaleController.mailController),
                            CustomTextField(
                              hintText: 'Enter Your Address',
                              controller: SaleController.addressController,
                            ),
                            CustomTextField(
                                hintText: 'Enter Your City',
                                controller: SaleController.cityController),
                            CustomTextField(
                              hintText: 'Enter Your Location',
                              controller: SaleController.locationController,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "TELL ME ABOUT VEHICLE",
                              style: getBoldStyle(
                                  color: Colormanager.black, fontSize: 18),
                            ),
                            CustomTextFielddrop(
                              hintText: 'Vehicle Type',
                              dropdownOptions: const [
                                '2 Wheeler',
                                '3 Wheeler',
                                '4 Wheeler'
                              ],
                            ),
                            CustomTextField(
                                hintText: 'Vehicle Model',
                                controller: SaleController.modelController),
                            CustomTextFielddrop(
                                hintText: 'Vehicle Condition',
                                dropdownOptions: const [
                                  'Well Maintained',
                                  'Showroom',
                                  'Average',
                                  'Running Condition'
                                ]),
                            CustomTextField(
                                hintText: 'Registeration UpTo',
                                controller: SaleController.registrationupto),
                            CustomTextField(
                                hintText: 'Insurance UpTo',
                                controller: SaleController.insuranceupto),
                            CustomTextFielddrop(
                                hintText: 'Variant',
                                dropdownOptions: const [
                                  'petrol',
                                  'diesel',
                                  'electrical',
                                  'hybrid'
                                ]),
                            // NumberTextField(
                            //   labelText: 'Total Km',
                            // ),
                            CustomTextField(
                                hintText: 'Total Km',
                                controller: SaleController.kilometerupto),
                            CustomTextField(
                                hintText: 'Enter More About Car Interior',
                                controller: SaleController.interior),
                            CustomTextField(
                                hintText: 'Enter More About Car Exterior',
                                controller: SaleController.exterior),
                            CustomTextField(
                                hintText: 'Engine Condition',
                                controller: SaleController.engine),
                            CustomTextField(
                                hintText: 'Tyre Conditions',
                                controller: SaleController.tyre),
                            CustomTextField(
                                hintText: 'AC Conditions',
                                controller: SaleController.ac),
                            CustomTextField(
                                hintText: 'Accident History',
                                controller: SaleController.accident),
                            // NumberTextField(
                            //   labelText: 'Price',
                            // ),
                            CustomTextField(
                                hintText: 'Selling Price',
                                controller: SaleController.sellingPrice),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "UPLOAD IMAGES",
                              style: getBoldStyle(
                                  color: Colormanager.black, fontSize: 18),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            UploadPaySlipScreen(),
                            SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                onPressed: () {
                                  sellNow(context);
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colormanager.primary)),
                                child: Text(
                                  "Register Now",
                                  style: getSemiBoldStyle(
                                      color: Colormanager.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )),
              ));
  }
}
