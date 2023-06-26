import 'package:flutter/material.dart';
import 'package:otodeals/core/asset_manager.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/controllers.dart';
import 'package:otodeals/core/styles_manager.dart';

class FilterDrawer extends StatefulWidget {
  final SearchFilters initialFilters;
   final Function(SearchFilters) onFiltersChanged;
  const FilterDrawer({super.key, required this.initialFilters, required this.onFiltersChanged});



  @override
  State<FilterDrawer> createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
    SearchFilters? filters;

  

 bool _isChecked1=false;
 bool     _isChecked2=false;
 bool _isChecked3=false;
 bool _isChecked4=false;
 bool _isautomatic=false;
 bool _ismanual=false;
   int? selectedYear;
  List<int> years = List<int>.generate(100, (int index) => DateTime.now().year - index);
   RangeValues _currentRangeValues = RangeValues( 60000, 40000000);
   double _interval = 10000000.0;
   Color _activeColor = Colormanager.greyText;
Color _inactiveColor = Colormanager.grey;
    @override
  void initState() {
    super.initState();
    selectedYear = DateTime.now().year;
       filters = widget.initialFilters;
        selectedYear = int.tryParse(filters?.modelyear ?? '');
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        // width: 40,
        // height: 40,
        color: Colormanager.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,

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
                    child: Image.asset(AssetImages.logoBlack)),
              ],
            ),
            const SizedBox(
              height:10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:18.0,top:10),
                  child: Text("Fuel Type",style: getSemiBoldStyle(color: Colors.black, fontSize:16) ,),
                ),
                SizedBox(height:3,),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                            value:_isChecked1,
                            onChanged: (value) {
                              setState(() {
                               
                               _isChecked1 = value??false;
                               Searchcontroller.fueltypecontroller.text='diesel';
                              });
                            },
                          ),
                          Text("Diesel",style: getRegularStyle(color:Colormanager.black,fontSize:14 ),)
                          

                   
                  ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                            value:_isChecked2,
                            onChanged: (value) {
                              setState(() {
                                    print(Searchcontroller.fueltypecontroller);
                               _isChecked2 = value??false;
                              });
                            },
                          ),
                          Text("Petrol",style: getRegularStyle(color:Colormanager.black,fontSize:14 ),)
                          

                   
                  ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                            value:_isChecked3,
                            onChanged: (value) {
                              setState(() {
                                    print(Searchcontroller.fueltypecontroller);
                               _isChecked3 = value??false;
                              });
                            },
                          ),
                          Text("Hybrid",style: getRegularStyle(color:Colormanager.black,fontSize:14 ),)
                          

                   
                  ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                            value:_isChecked4,
                            onChanged: (value) {
                              setState(() {
                                    print(Searchcontroller.fueltypecontroller);
                               _isChecked4 = value??false;
                              });
                            },
                          ),
                          Text("Electrical",style: getRegularStyle(color:Colormanager.black,fontSize:14 ),)
                          

                   
                  ],
                ),
              ],
            ),
            const SizedBox(
              height:15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Padding(
                  padding: const EdgeInsets.only(left:20),
                  child: Text("Gear Shift",style: getSemiBoldStyle(color: Colors.black, fontSize:16) ,),
                ),
                     Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                            value:_isautomatic,
                            onChanged: (value) {
                              setState(() {
                               _isautomatic = value??false;
                              });
                            },
                          ),
                          Text("Automatic",style: getRegularStyle(color:Colormanager.black,fontSize:14 ),)
                          

                   
                  ],
                ),
                     Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                            value:_ismanual,
                            onChanged: (value) {
                              setState(() {
                               _ismanual = value??false;
                              });
                            },
                          ),
                          Text("Manual",style: getRegularStyle(color:Colormanager.black,fontSize:14 ),)
                          

                   
                  ],
                ),
              ],
            ),
            const SizedBox(
              height:20,
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Model Year",style: getSemiBoldStyle(color: Colors.black, fontSize:16) ,),
                 SizedBox(width:20,),
                  Container(
                    height: 60,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                     
                    ),
                    child: DropdownButtonFormField<int>(
                      iconDisabledColor: Colormanager.grey,
                      iconEnabledColor: Colormanager.greyText,
                      items:years.map((int year){
                        return DropdownMenuItem <int>(
                          value: year,
                          child:Text('$year') );
                  
                      }).toList(),
                     onChanged:(int?newValue){
                      setState(() {
                        selectedYear=newValue;
                      });
                  
                     },
                     decoration: InputDecoration(
                  
                      
                      labelText: 'Select Year',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colormanager.grey,
                          
                          width: 1.0,
                        )
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal:16,vertical:2),
                     ),
                     ),
                  ),
                  
                ],
              ),
              
            ),
          
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Padding(
                   padding: const EdgeInsets.only(left:20.0,top:8),
                   child: Text("Filter Brand",style: getSemiBoldStyle(color: Colors.black, fontSize:16) ,),
                 ),  
                 SizedBox(width:10,),
                  Container(
                    height: 40,
                    width: 170,
                    child: TextFormField(
                   decoration: new InputDecoration(
                    labelText: "Brand Id",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(
                        width: 1
                      ),
                    ),
                    //fillColor: Colors.green
                                  ),
                    ),
                  )
              ],
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(top:8.0,left:20),
              child: Text("Price",style: getSemiBoldStyle(color: Colors.black, fontSize:16) ,),
            ),
            SizedBox(height: 20,),
            Container(
              height: 30,
              width: 400,
              child: RangeSlider(values: _currentRangeValues, 
              min: 50000,
              max: 50000000,
              activeColor: Colormanager.grey,
              inactiveColor: Colormanager.grey,
              divisions: (1000000000 ~/ _interval).toInt(),
              
                     labels: RangeLabels(
                      _currentRangeValues.start.toInt().toString(),
                      _currentRangeValues.end.toInt().toString(),
                    ),
              onChanged:(RangeValues values) {
                      setState(() {
              _currentRangeValues = values;
                      });
                    },),
            ),
           
              Padding(
                padding: const EdgeInsets.only(top:18.0,left:100),
                child: ElevatedButton(onPressed: (){
                List<String> selectedFuelTypes = [];
      if (_isChecked1) selectedFuelTypes.add('Diesel');
      if (_isChecked2) selectedFuelTypes.add('Petrol');
      if (_isChecked3) selectedFuelTypes.add('Hybrid');
      if (_isChecked4) selectedFuelTypes.add('Electrical');
      List<String>selectedgearshift=[];
      if(_isautomatic) selectedgearshift.add('automatic');
      if(_ismanual) selectedgearshift.add('manual');

      int? selectedModelYear = selectedYear;
       double minPrice = _currentRangeValues.start;
      double maxPrice = _currentRangeValues.end;

       SearchFilters selectedFilters = SearchFilters(
                    fuelType: selectedFuelTypes.toString(),
                    gearshift: selectedgearshift.toString(),
                    modelyear: selectedModelYear.toString(),
                    minPrice: minPrice,
                    maxPrice: maxPrice, type: '', 
                 
      );
      print(selectedFilters);
      widget.onFiltersChanged(selectedFilters);


                }, child:
                Text("Apply Filter",style: getMediumtStyle(color:Colors.white,fontSize:15),
                ),  style: ElevatedButton.styleFrom(
                      primary:Colormanager.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),),
              )
            
            
            // SizedBox(
            //   height: size.height * .5,
            // )
          ],
        ),
      ),
    );
  }
}
class SearchFilters {
  String fuelType=Searchcontroller.fueltypecontroller.text; // Replace with the actual filter options you have
  String gearshift=Searchcontroller.gearshiftcontroller.text;
  String type=Searchcontroller.vehicletypecontroller.text;
  String minPrice=Searchcontroller.minpricecontroller.text;
  String maxPrice=Searchcontroller.maxpricecontroller.text;
  String modelyear=Searchcontroller.modelyearcontroller.text;


  // Add more filter options if needed

  SearchFilters({ required this.gearshift,required this.type,required this.modelyear, required this.fuelType, required  minPrice, required maxPrice});
} 
       