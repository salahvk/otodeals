import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/styles_manager.dart';

class NumberTextField extends StatefulWidget {
  final String labelText;

  const NumberTextField({Key? key, required this.labelText}) : super(key: key);

  @override
  _NumberTextFieldState createState() => _NumberTextFieldState();
}

class _NumberTextFieldState extends State<NumberTextField> {
  int number = 0;

  void increaseNumber() {
    setState(() {
      number++;
    });
  }

  void decreaseNumber() {
    setState(() {
      if (number > 0) {
        number--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 25,
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TextField(
            decoration: InputDecoration(
              // labelText: widget.labelText,
              hintText: widget.labelText,
              hintStyle:
                  getMediumtStyle(color: Colormanager.greyText, fontSize: 15),
              // suffixIcon: Container(
              //   width: 10,
              //   padding: EdgeInsets.zero,

              //   child: Column(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       IconButton(
              //         icon: Icon(Icons.keyboard_arrow_up_rounded),
              //         onPressed: increaseNumber,
              //       ),
              //        SizedBox(height:0),
              //       IconButton(
              //         icon: Icon(Icons.keyboard_arrow_down),
              //         onPressed: decreaseNumber,
              //       ),
              //     ],
              //   ),
              // ),
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                number = int.tryParse(value) ?? 0;
              });
            },
            controller: TextEditingController(text: number.toString()),
          ),
        ),
      ],
    );
  }
}
