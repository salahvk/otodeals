import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/styles_manager.dart';

// ignore: must_be_immutable
class TermsAndCondition extends StatefulWidget {
  bool? isclicked;
   TermsAndCondition({ this.isclicked=false});

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, Routes.termsAndConditions);
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              value:widget.isclicked,
              onChanged: (value) {
                setState(() {
                  widget.isclicked = value;
                });
              },
            ),
            Text("I agree to the",
                style:
                    getBoldStyle(color: const Color(0xffafafaf), fontSize: 14)),
            Text(" terms & conditions",
                style:
                    getBoldStyle(color: Colormanager.textColor, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
