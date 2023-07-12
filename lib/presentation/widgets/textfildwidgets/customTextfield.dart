import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/styles_manager.dart';

class CustomTextFielddrop extends StatefulWidget {
  final String hintText;
  final List<String> dropdownOptions;

  const CustomTextFielddrop({Key? key, required this.hintText, required this.dropdownOptions})
      : super(key: key);

  @override
  _CustomTextFielddropState createState() => _CustomTextFielddropState();
}

class _CustomTextFielddropState extends State<CustomTextFielddrop> {
  String selectedOption = '';
    @override
  void initState() {
    super.initState();
    selectedOption = widget.dropdownOptions.isNotEmpty ? widget.dropdownOptions[0] : '';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              // width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child:   DropdownButtonFormField<String>(
          value: selectedOption,
          style: getMediumtStyle(color:Colormanager.greyText,fontSize:15),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
          ),
          items: widget.dropdownOptions.map((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedOption = newValue!;
            });
          },
          hint:Text(widget.hintText,style: getMediumtStyle(color:Colormanager.grey,fontSize: 15),),
        ),
        ),
        
      
      ],
    );
  }
}
