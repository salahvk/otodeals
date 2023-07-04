import 'package:flutter/material.dart';
import 'package:otodeals/core/asset_manager.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/controllers.dart';
import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/data/repositories/vehiclelisting.dart';

class FilterDrawer extends StatefulWidget {
  // final SearchFilters initialFilters;
  // final Function(SearchFilters) onFiltersChanged;

  const FilterDrawer({
    Key? key,
    // required this.initialFilters,
    // required this.onFiltersChanged,
  }) : super(key: key);

  @override
  State<FilterDrawer> createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isChecked3 = false;
  bool _isChecked4 = false;
  bool _isautomatic = false;
  bool _ismanual = false;
  // int? selectedYear;
  // List<int> years = List<int>.generate(
  //   100,
  //   (int index) => DateTime.now().year - index,
  // );
  RangeValues _currentRangeValues = RangeValues(60000, 40000000);
  final double _interval = 10000000.0;

  RangeValues _currentRangeYears = RangeValues(1994, 2023);
  final double _yearinterval = 1;
  final minyear = Searchcontroller.yearrange1controller.text;
  final maxyear = Searchcontroller.yearrange2controller.text;
  final minprice = Searchcontroller.minpricecontroller.text;
  final maxprice = Searchcontroller.maxpricecontroller.text;

  @override
  void initState() {
    super.initState();
    // selectedYear = DateTime.now().year;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: FittedBox(
        alignment: Alignment.centerRight,
        child: Container(
          width: size.width * .8,
          color: Colormanager.white,
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
                    padding: const EdgeInsets.only(left: 18.0, top: 10),
                    child: Text(
                      "Fuel Type",
                      style:
                          getSemiBoldStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 3),
                  Row(
                    children: [
                      Checkbox(
                        value: _isChecked1,
                        onChanged: (value) {
                          setState(() {
                            _isChecked1 = value ?? false;
                          });
                          if (_isChecked1) {
                            _isChecked2 = false;
                            _isChecked3 = false;
                            _isChecked4 = false;
                            Searchcontroller.fueltypecontroller.text =
                                '&filter_fueltype[]=diesel';
                          } else {
                            Searchcontroller.fueltypecontroller.text = '';
                          }
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
                          if (_isChecked2) {
                            _isChecked1 = false;
                            _isChecked3 = false;
                            _isChecked4 = false;
                            Searchcontroller.fueltypecontroller.text =
                                '&filter_fueltype[]=petrol';
                          } else {
                            Searchcontroller.fueltypecontroller.text = '';
                          }
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
                          if (_isChecked3) {
                            _isChecked1 = false;
                            _isChecked2 = false;
                            _isChecked4 = false;
                            Searchcontroller.fueltypecontroller.text =
                                '&filter_fueltype[]=hybrid';
                          } else {
                            Searchcontroller.fueltypecontroller.text = '';
                          }
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
                          if (_isChecked4) {
                            _isChecked1 = false;
                            _isChecked2 = false;
                            _isChecked3 = false;
                            Searchcontroller.fueltypecontroller.text =
                                '&filter_fueltype[]=electric';
                          } else {
                            Searchcontroller.fueltypecontroller.text = '';
                          }
                        },
                      ),
                      Text(
                        "Electric",
                        style: getRegularStyle(
                            color: Colormanager.black, fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, top: 10),
                    child: Text(
                      "Gear Shift",
                      style:
                          getSemiBoldStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 3),
                  Row(
                    children: [
                      Checkbox(
                        value: _isautomatic,
                        onChanged: (value) {
                          setState(() {
                            _isautomatic = value ?? false;
                          });
                          if (_isautomatic) {
                            _ismanual = false;
                            Searchcontroller.gearshiftcontroller.text =
                                '&filter_gearshift[]=automatic';
                          } else {
                            Searchcontroller.gearshiftcontroller.text = '';
                          }
                        },
                      ),
                      Text(
                        "Automatic",
                        style: getRegularStyle(
                            color: Colormanager.black, fontSize: 14),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _ismanual,
                        onChanged: (value) {
                          setState(() {
                            _ismanual = value ?? false;
                          });
                          if (_ismanual) {
                            _isautomatic = false;
                            Searchcontroller.gearshiftcontroller.text =
                                '&filter_gearshift[]=manual';
                          }
                        },
                      ),
                      Text(
                        "Manual",
                        style: getRegularStyle(
                            color: Colormanager.black, fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, top: 10),
                    child: Text(
                      "Model Year",
                      style:
                          getSemiBoldStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 3),
                  RangeSlider(
                    values: _currentRangeYears,
                    min: 1994,
                    max: 2023,
                    divisions:
                        (_currentRangeYears.end - _currentRangeYears.start) ~/
                            _yearinterval,
                    labels: RangeLabels(
                      '${_currentRangeYears.start.round()}',
                      '${_currentRangeYears.end.round()}',
                    ),
                    onChanged: (RangeValues values) {
                      Searchcontroller.yearrange1controller.text =
                          _currentRangeYears.start.toString();
                      Searchcontroller.yearrange2controller.text =
                          _currentRangeYears.end.toString();
                      setState(() {
                        _currentRangeYears = values;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, top: 10),
                    child: Text(
                      "Price",
                      style:
                          getSemiBoldStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 3),
                  RangeSlider(
                    values: _currentRangeValues,
                    min: 60000,
                    max: 40000000,
                    divisions:
                        (_currentRangeValues.end - _currentRangeValues.start) ~/
                            _interval,
                    labels: RangeLabels(
                      '${_currentRangeValues.start.round()}',
                      '${_currentRangeValues.end.round()}',
                    ),
                    onChanged: (RangeValues values) {
                      Searchcontroller.minpricecontroller.text =
                          _currentRangeValues.start.toString();
                      Searchcontroller.maxpricecontroller.text =
                          _currentRangeValues.end.toString();

                      setState(() {
                        _currentRangeValues = values;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: ElevatedButton(
                      onPressed: () {
                        fetchSearchResults(context);
                        Navigator.pop(context);

                        print(_currentRangeValues.start);
                        print(_currentRangeValues.end);
                        print(_currentRangeYears);
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
                      Searchcontroller.yearrange2controller.clear();

                      Navigator.pop(context);

                      print(_currentRangeValues.start);
                      print(_currentRangeValues.end);
                      print(_currentRangeYears);
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
