import 'package:flutter/material.dart';
import 'package:otodeals/core/asset_manager.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/styles_manager.dart';

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
  int? selectedYear;
  List<int> years = List<int>.generate(
    100,
    (int index) => DateTime.now().year - index,
  );
  RangeValues _currentRangeValues = RangeValues(60000, 40000000);
  final double _interval = 10000000.0;

  @override
  void initState() {
    super.initState();
    selectedYear = DateTime.now().year;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
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
                    style: getSemiBoldStyle(color: Colors.black, fontSize: 16),
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
                      },
                    ),
                    Text(
                      "Diesel",
                      style: getRegularStyle(color: Colormanager.black, fontSize: 14),
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
                      },
                    ),
                    Text(
                      "Petrol",
                      style: getRegularStyle(color: Colormanager.black, fontSize: 14),
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
                      },
                    ),
                    Text(
                      "Hybrid",
                      style: getRegularStyle(color: Colormanager.black, fontSize: 14),
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
                      },
                    ),
                    Text(
                      "Electric",
                      style: getRegularStyle(color: Colormanager.black, fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 10),
                  child: Text(
                    "Gear Shift",
                    style: getSemiBoldStyle(color: Colors.black, fontSize: 16),
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
                      },
                    ),
                    Text(
                      "Automatic",
                      style: getRegularStyle(color: Colormanager.black, fontSize: 14),
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
                      },
                    ),
                    Text(
                      "Manual",
                      style: getRegularStyle(color: Colormanager.black, fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 10),
                  child: Text(
                    "Model Year",
                    style: getSemiBoldStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                SizedBox(height: 3),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18),
                  child: DropdownButton<int>(
                    value: selectedYear,
                    onChanged: (int? newValue) {
                      setState(() {
                        selectedYear = newValue;
                      });
                    },
                    items: years.map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 10),
                  child: Text(
                    "Price",
                    style: getSemiBoldStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                SizedBox(height: 3),
                RangeSlider(
                  values: _currentRangeValues,
                  min: 60000,
                  max: 40000000,
                  divisions: (_currentRangeValues.end - _currentRangeValues.start) ~/ _interval,
                  labels: RangeLabels(
                    '${_currentRangeValues.start.round()}',
                    '${_currentRangeValues.end.round()}',
                  ),
                  onChanged: (RangeValues values) {
                    setState(() {
                      _currentRangeValues = values;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: ElevatedButton(
                onPressed: () {
                  SearchFilters selectedFilters = SearchFilters(
                    fuelTypes: getSelectedFuelTypes(),
                    gearShifts: getSelectedGearShifts(),
                    modelYear: selectedYear,
                    minPrice: _currentRangeValues.start,
                    maxPrice: _currentRangeValues.end,
                  );
                  print(selectedFilters);
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
                  style: getMediumtStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<FuelType> getSelectedFuelTypes() {
    List<FuelType> selectedTypes = [];
    if (_isChecked1) selectedTypes.add(FuelType.diesel);
    if (_isChecked2) selectedTypes.add(FuelType.petrol);
    if (_isChecked3) selectedTypes.add(FuelType.hybrid);
    if (_isChecked4) selectedTypes.add(FuelType.electric);
    return selectedTypes;
  }

  List<GearShift> getSelectedGearShifts() {
    List<GearShift> selectedShifts = [];
    if (_isautomatic) selectedShifts.add(GearShift.automatic);
    if (_ismanual) selectedShifts.add(GearShift.manual);
    return selectedShifts;
  }
}
class SearchFilters {
  List<FuelType>? fuelTypes;
  List<GearShift>? gearShifts;
  int? modelYear;
  double? minPrice;
  double? maxPrice;

  SearchFilters({
    this.fuelTypes,
    this.gearShifts,
    this.modelYear,
    this.minPrice,
    this.maxPrice,
  });
}

enum FuelType {
  diesel,
  petrol,
  hybrid,
  electric,
}

enum GearShift {
  automatic,
  manual,
}

       