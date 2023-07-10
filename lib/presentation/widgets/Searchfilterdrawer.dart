import 'package:flutter/material.dart';
import 'package:otodeals/core/asset_manager.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/controllers.dart';
import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/data/providers/dataprovider.dart';
import 'package:otodeals/data/repositories/vehiclebrandswebservice.dart';

import 'package:otodeals/data/repositories/vehiclelisting.dart';
import 'package:provider/provider.dart';

class FilterDrawer extends StatefulWidget {
  const FilterDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<FilterDrawer> createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  List<int> selectedYears = [];
  List<String>selectedBrands=[];
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isChecked3 = false;
  bool _isChecked4 = false;
  bool _isautomatic = false;
  bool _ismanual = false;

  bool isModalYearVisible = false;
  bool isBrandsVisible=false;
  bool isFuelTypeVisible = false;
  bool isTransmissionVisible = false;
  String? selectedFuelTypes;
  String? selectedTransmission;
  String? ModelYears;
  String? Brands;

  
  final Modelyear = Searchcontroller.yearrange1controller.text;
  final minprice = Searchcontroller.minpricecontroller.text;
  final maxprice = Searchcontroller.maxpricecontroller.text;

void updateselectedYears(){
  ModelYears=selectedYears.join(',');

}
void updateselectedBrands(){
  Brands=selectedBrands.join(',');

}
  
  void updateSelectedTransmission() {
  List<String> transmisson = [];
  if (_isautomatic ) transmisson.add('automatic');
  if (_ismanual) transmisson.add('manual');

  selectedTransmission = transmisson.join(',');
}
 Map<String, String> brandIdMap = {}; 


  void updateSelectedFuelTypes() {
  List<String> fuelTypes = [];
  if (_isChecked1) fuelTypes.add('diesel');
  if (_isChecked2) fuelTypes.add('petrol');
  if (_isChecked3) fuelTypes.add('hybrid');
  if (_isChecked4) fuelTypes.add('electric');

  selectedFuelTypes = fuelTypes.join(',');
}

  @override
  void initState() {
    super.initState();
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await getvehiclebrands(context);
    
    _isChecked1 = Searchcontroller.fueltypecontroller.text.contains('diesel');
    _isChecked2 = Searchcontroller.fueltypecontroller.text.contains('petrol');
    _isChecked3 = Searchcontroller.fueltypecontroller.text.contains('hybrid');
    _isChecked4 = Searchcontroller.fueltypecontroller.text.contains('electric');
    _isautomatic =
        Searchcontroller.gearshiftcontroller.text.contains('automatic');
    _ismanual = Searchcontroller.gearshiftcontroller.text.contains('manual');
   }); // selectedYear = DateTime.now().year;
  }

  @override
  Widget build(BuildContext context) {
      final brandsprovider = Provider.of<DataProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        width: size.width * .8,
        height: size.height * .9,
        color: Colormanager.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: size.width * .4,
                    height: 20,
                    child: Image.asset(AssetImages.logoBlack),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 18.0, top: 10, right: 20),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isModalYearVisible = !isModalYearVisible;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Model Year",
                            style: getSemiBoldStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isModalYearVisible,
                    child: SizedBox(
                      height: 300,
                      child: ListView.builder(
                        itemCount: 2024 - 1973 + 1,
                        itemBuilder: (context, index) {
                          int year = 2024 - index;
                          return CheckboxListTile(
                            title: Padding(
                              padding: EdgeInsets.only(
                                  left: 8.0), // Adjust as needed
                              child: Text(
                                year.toString(),
                                style: TextStyle(
                                    fontSize: 16.0), // Adjust as needed
                              ),
                            ),
                            dense: true,
                            value: selectedYears.contains(year),
                            onChanged: (value) {

                              setState(() {
                                if (value ?? false) {
                                  selectedYears.add(year);
                                } else {
                                  selectedYears.remove(year);
                                }
                              });
                              updateselectedYears();
                              Searchcontroller.yearrange1controller.text='&modelyear=$ModelYears';

                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 18.0, top: 20, right: 20),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isFuelTypeVisible = !isFuelTypeVisible;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Fuel Type",
                            style: getSemiBoldStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 3),
                  Visibility(
                    visible: isFuelTypeVisible,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: _isChecked1,
                              onChanged: (value) {
                  
                                setState(() {
                                  _isChecked1 = value ?? false;
                                });
                                updateSelectedFuelTypes();
                            
                                Searchcontroller.fueltypecontroller.text =
                                    '&filter_fueltype=$selectedFuelTypes';
                                // } else {
                                //   Searchcontroller.fueltypecontroller.clear();
                                // }
                                print(selectedFuelTypes);
                              },
                            ),
                            Text(
                              "Diesel",
                              style: getRegularStyle(
                                  color: Colormanager.black, fontSize: 14),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: _isChecked2,
                              onChanged: (value) {
                                setState(() {
                                  _isChecked2 = value ?? false;
                                });
                                
                                updateSelectedFuelTypes();
                             
                                Searchcontroller.fueltypecontroller.text =
                                    '&filter_fueltype=$selectedFuelTypes';
                                // } else {
                                // Searchcontroller.fueltypecontroller.clear();
                                // }
                              },
                            ),
                            Text(
                              "Petrol",
                              style: getRegularStyle(
                                  color: Colormanager.black, fontSize: 14),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: _isChecked3,
                              onChanged: (value) {
                                setState(() {
                                  _isChecked3 = value ?? false;
                                });
                                updateSelectedFuelTypes();
                                
                                Searchcontroller.fueltypecontroller.text =
                                    '&filter_fueltype=$selectedFuelTypes';
                                // } else {
                      
                                // }
                              },
                            ),
                            Text(
                              "Hybrid",
                              style: getRegularStyle(
                                  color: Colormanager.black, fontSize: 14),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: _isChecked4,
                              onChanged: (value) {
                                setState(() {
                                  _isChecked4 = value ?? false;
                                });
                                updateSelectedFuelTypes();
                               
                                Searchcontroller.fueltypecontroller.text =
                                    '&filter_fueltype=$selectedFuelTypes';
                                // } else {
                 
                                // }
                              },
                            ),
                            Text(
                              "Electric",
                              style: getRegularStyle(
                                  color: Colormanager.black, fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),
                   Padding(
                    padding:
                        const EdgeInsets.only(left: 18.0, top: 10, right: 20),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isBrandsVisible = !isBrandsVisible;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Brands",
                            style: getSemiBoldStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible:isBrandsVisible,
                    child: SizedBox(
                      height: 300,
                      child: ListView.builder(
                        itemCount: brandsprovider.vbrands?.brands?.length,
                        itemBuilder: (context, index) {
                          List? brands= brandsprovider.vbrands?.brands;
                           String? brandId =brandsprovider.vbrands?.brands![index].id.toString() ?? "";
                           String? brandname=brandsprovider.vbrands?.brands![index].name?? "";
                      
                          return CheckboxListTile(
                            title: Padding(
                              padding: EdgeInsets.only(
                                  left: 8.0), // Adjust as needed
                              child: Text(
                             brandname,
                                style: TextStyle(
                                    fontSize: 16.0), // Adjust as needed
                              ),
                            ),
                            dense: true,
                            value:selectedBrands.contains(brandId),
                            onChanged: (value) {

                              setState(() {
                                if (value ?? false) {
                                  selectedBrands.add(brandId);
                                } else {
                                  selectedBrands.remove(brandId);
                                }
                              });
                              updateselectedBrands();
                              Searchcontroller.vehiclebrandcontroller.text='&filter_brand=$Brands';

                            },
                          );
                        },
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 10),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 18.0, top: 10, right: 20),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isTransmissionVisible = !isTransmissionVisible;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Transmission",
                            style: getSemiBoldStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 3),
                  Visibility(
                    visible: isTransmissionVisible,
                    child: Row(
                      children: [
                        Checkbox(
                          value: _isautomatic,
                          onChanged: (value) {
                        
                            setState(() {
                              _isautomatic = value ?? false;
                            });
                            updateSelectedTransmission();
                           
                              Searchcontroller.gearshiftcontroller.text =
                                  '&filter_gearshift=$selectedTransmission';
                              print(selectedTransmission);
                          },
                        ),
                        Text(
                          "Automatic",
                          style: getRegularStyle(
                              color: Colormanager.black, fontSize: 14),
                        ),
                        Checkbox(
                          value: _ismanual,
                          onChanged: (value) {
                            print(selectedTransmission);
                            setState(() {
                              _ismanual = value ?? false;
                            });
                            updateSelectedTransmission();
                            
                              Searchcontroller.gearshiftcontroller.text =
                                  '&filter_gearshift=$selectedTransmission';
                           
                          },
                        ),
                        Text(
                          "Manual",
                          style: getRegularStyle(
                              color: Colormanager.black, fontSize: 14),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 18.0, top: 10),
                  //   child: Text(
                  //     "Model Year",
                  //     style: getSemiBoldStyle(color: Colors.black, fontSize: 16),
                  //   ),
                  // ),
                  // SizedBox(height: 3),
                  // RangeSlider(
                  //   values: _currentRangeYears,
                  //   min: 1990,
                  //   max: 2023,
                  //   divisions: 33,
                  //   labels: RangeLabels(
                  //     '${_currentRangeYears.start.round()}',
                  //     '${_currentRangeYears.end.round()}',
                  //   ),
                  //   onChanged: (RangeValues values) {
                  //     Searchcontroller.yearrange1controller.text =
                  //         _currentRangeYears.start.toString();
                  //     Searchcontroller.yearrange2controller.text =
                  //         _currentRangeYears.end.toString();
                  //     setState(() {
                  //       _currentRangeYears = values;
                  //     });
                  //   },
                  // ),
                  // const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, top: 10),
                    child: Text(
                      "Budget",
                      style:
                          getSemiBoldStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 3),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 18.0, right: 18, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: Searchcontroller.minpricecontroller,
                            decoration: InputDecoration(hintText: 'Min'),
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Text('to'),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: Searchcontroller.maxpricecontroller,
                            decoration: InputDecoration(hintText: 'Max'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // RangeSlider(
                  //   values: _currentRangeValues,
                  //   min: 0,
                  //   max: 100,
                  //   divisions: 10,
                  //   labels: RangeLabels(
                  //     '${_currentRangeValues.start}',
                  //     '${_currentRangeValues.end}',
                  //   ),
                  //   onChanged: (RangeValues values) {
                  //     Searchcontroller.minpricecontroller.text =
                  //         _currentRangeValues.start.toString();
                  //     Searchcontroller.maxpricecontroller.text =
                  //         _currentRangeValues.end.toString();

                  //     setState(() {
                  //       _currentRangeValues = values;
                  //     });
                  //   },
                  // ),
                ],
              ),
              // const SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: ElevatedButton(
                      onPressed: () {
                      
                        fetchSearchResults(context);
                        Navigator.pop(context);
                        print(Searchcontroller.fueltypecontroller.text);
                        print(Searchcontroller.vehiclebrandcontroller.text);


                        // SearchFilters selectedFilters = SearchFilters(
                        //   fuelTypes: getSelectedFuelTypes(),
                        //   gearShifts: getSelectedGearShifts(),
                        //  minmodelYear:_currentRangeYears.start,
                        //  maxmodelYear:_currentRangeYears.end,
                        //   minPrice: _currentRangeValues.start,
                        //   maxPrice: _currentRangeValues.end,
                        // );
                        // print(selectedFilters);
                        // widget.onFiltersChanged(selectedFilters);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colormanager.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Apply Filter",
                        style:
                            getMediumtStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Searchcontroller.fueltypecontroller.clear();
                      Searchcontroller.gearshiftcontroller.clear();
                      Searchcontroller.maxpricecontroller.clear();
                      Searchcontroller.minpricecontroller.clear();
                      Searchcontroller.yearrange1controller.clear();
                      Searchcontroller.vehiclebrandcontroller.clear();
                  

                      Navigator.pop(context);
                      fetchSearchResults(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colormanager.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Clear Filter",
                      style: getMediumtStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
